import 'dart:convert';
import 'dart:math';

import 'package:drift/drift.dart' show Value;
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../../core/database/app_database.dart';
import '../../core/errors/logger.dart';
import '../../core/models/sync_response.dart';
import '../../core/services/session_manager.dart';
import '../../core/services/sync_status_service.dart';

class _ErrorClassification {
  final String code;
  final bool shouldRetry;

  const _ErrorClassification({required this.code, required this.shouldRetry});
}

class SyncService {
  final AppDatabase _database;
  final Dio _dio;
  final SessionManager _sessionManager;
  SyncStatusService? _statusService;
  static const _uuid = Uuid();
  static const int _maxBatchSize = 20;
  static const int _maxRetries = 5;

  bool _syncInProgress = false;

  SyncService({
    required AppDatabase database,
    required Dio dio,
    required SessionManager sessionManager,
    SyncStatusService? statusService,
  })  : _database = database,
        _dio = dio,
        _sessionManager = sessionManager,
        _statusService = statusService;

  bool get isSyncing => _syncInProgress;

  Future<void> queueOperation({
    required String entidad,
    required String tipo,
    required Map<String, dynamic> payload,
  }) async {
    final now = DateTime.now();
    final companion = SyncQueueTableCompanion.insert(
      id: _uuid.v4(),
      entidad: entidad,
      tipo: tipo,
      payloadJson: jsonEncode(payload),
      createdAt: now,
      updatedAt: now,
    );

    await _database.insertSyncOperation(companion);
    _statusService?.refresh();
    AppLogger.info('[SYNC QUEUE] Queued $tipo $entidad');
  }

  Future<int> syncPending() async {
    if (_syncInProgress) {
      AppLogger.info('[SYNC SERVICE] Sync already in progress, skipping');
      return 0;
    }

    if (!_sessionManager.hasSucursal) {
      AppLogger.warning('[SYNC BLOCKED] No activeSucursalId selected');
      return 0;
    }

    _syncInProgress = true;
    _statusService?.notifySyncing();
    int totalSynced = 0;

    try {
      while (true) {
        final operations = await _database.getRetryableOperations(
          limit: _maxBatchSize,
          maxRetries: _maxRetries,
        );

        if (operations.isEmpty) break;

        final maxRetryCount = operations
            .map((op) => op.retryCount)
            .reduce((a, b) => a > b ? a : b);
        if (maxRetryCount > 0) {
          final delaySeconds = min(30, pow(2, maxRetryCount).toInt());
          AppLogger.info('[SYNC SERVICE] Backoff delay: ${delaySeconds}s (max retryCount: $maxRetryCount)');
          await Future.delayed(Duration(seconds: delaySeconds));
        }

        final syncingIds = operations.map((o) => o.id).toList();
        await _database.markOperationsAsSyncing(syncingIds);

        try {
          final response = await _sendBatch(operations);
          await _resolveConflicts(response.conflicts, operations);
          final syncedIds = operations
              .where((op) => !response.conflicts.any((c) => c.id == op.id))
              .map((o) => o.id)
              .toList();
          if (syncedIds.isNotEmpty) {
            await _database.markOperationsAsSent(syncedIds);
          }
          totalSynced += syncedIds.length;
          AppLogger.info('[SYNC SERVICE] Synced ${syncedIds.length} operations, ${response.conflicts.length} conflicts');
        } on DioException catch (e) {
          final classified = _classifyDioError(e);
          AppLogger.error('[SYNC SERVICE] Batch sync failed: ${classified.code} - ${e.message}');
          for (final op in operations) {
            if (classified.shouldRetry && op.retryCount < _maxRetries) {
              await _database.markOperationAsError(op.id, e.message, errorCode: classified.code);
            } else {
              await _database.markOperationAsError(op.id, e.message, errorCode: classified.code);
              AppLogger.warning('[SYNC SERVICE] Operation ${op.id} marked as permanent error (${classified.code})');
            }
          }
        } on StateError catch (e) {
          AppLogger.error('[SYNC SERVICE] Sync aborted: ${e.message}');
          break;
        } catch (e) {
          AppLogger.error('[SYNC SERVICE] Unexpected error: $e');
          for (final op in operations) {
            await _database.markOperationAsError(op.id, e.toString(), errorCode: 'PARSE_ERROR');
          }
        }
      }
    } finally {
      _syncInProgress = false;
      final remaining = await _database.getPendingOperationsCount();
      final errors = await _database.getErrorOperationsCount();
      _statusService?.notifySyncComplete(totalSynced, remaining + errors);
    }

    return totalSynced;
  }

  static bool _isValidUuid(String? value) {
    if (value == null || value.isEmpty) return false;
    return RegExp(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$')
        .hasMatch(value);
  }

  static Map<String, dynamic> _cleanMap(Map<String, dynamic> map) {
    final cleaned = <String, dynamic>{};
    for (final entry in map.entries) {
      if (entry.value == null) continue;
      if (entry.value is String && (entry.value as String).isEmpty) continue;
      if (entry.value is Map) {
        cleaned[entry.key] = _cleanMap(entry.value as Map<String, dynamic>);
      } else {
        cleaned[entry.key] = entry.value;
      }
    }
    return cleaned;
  }

  Future<SyncResponse> _sendBatch(List<SyncQueueTableData> operations) async {
    final session = _sessionManager.session;

    final empresaId = session?.empresaId;
    final sucursalId = session?.activeSucursalId;
    final clienteId = session?.usuarioId;

    if (!_isValidUuid(empresaId) || !_isValidUuid(sucursalId) || !_isValidUuid(clienteId)) {
      AppLogger.error('[SYNC SERVICE] Missing required session context — empresaId=${_isValidUuid(empresaId)}, sucursalId=${_isValidUuid(sucursalId)}, clienteId=${_isValidUuid(clienteId)}');
      throw StateError('[SYNC] Missing required session context');
    }

    final operaciones = operations.map((op) {
      final datos = _cleanMap(jsonDecode(op.payloadJson));
      if (datos.containsKey('cliente_id') && !_isValidUuid(datos['cliente_id'] as String?)) {
        datos['cliente_id'] = clienteId;
      }
      return {
        'cliente_id': clienteId,
        'tipo': op.tipo,
        'entidad': op.entidad,
        'datos': datos,
        'timestamp': op.createdAt.toUtc().toIso8601String(),
      };
    }).toList();

    final payload = <String, dynamic>{
      'cliente_id': clienteId,
      'empresa_id': empresaId,
      'sucursal_id': sucursalId,
      'dispositivo_id': clienteId,
      'operaciones': operaciones,
      'ultimo_sync': DateTime.now().toUtc().toIso8601String(),
    };

    AppLogger.info('[SYNC SERVICE] /sync payload: ops=${operaciones.length}, empresa_id=$empresaId, sucursal_id=$sucursalId, cliente_id=$clienteId');

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (session?.token != null && session!.token.isNotEmpty) {
      headers['Authorization'] = 'Bearer ${session.token}';
    }

    final response = await _dio.post(
      '/sync',
      data: jsonEncode(payload),
      options: Options(
        headers: headers,
        contentType: 'application/json',
      ),
    );

    AppLogger.info('[SYNC SERVICE] /sync response: ${response.statusCode}');

    final responseData = response.data;
    if (responseData is Map<String, dynamic>) {
      return SyncResponse.fromJson(responseData);
    }
    return const SyncResponse(synced: 0, conflicts: []);
  }

  _ErrorClassification _classifyDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const _ErrorClassification(code: 'TIMEOUT', shouldRetry: true);
    }
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.unknown) {
      return const _ErrorClassification(code: 'NETWORK_ERROR', shouldRetry: true);
    }
    if (e.response != null) {
      final statusCode = e.response!.statusCode ?? 0;
      if (statusCode == 408) {
        return const _ErrorClassification(code: '408', shouldRetry: true);
      }
      if (statusCode >= 400 && statusCode < 500) {
        return _ErrorClassification(code: '$statusCode', shouldRetry: false);
      }
      if (statusCode >= 500) {
        return _ErrorClassification(code: '$statusCode', shouldRetry: true);
      }
    }
    return const _ErrorClassification(code: 'UNKNOWN', shouldRetry: true);
  }

  Future<void> _resolveConflicts(
    List<SyncConflict> conflicts,
    List<SyncQueueTableData> operations,
  ) async {
    for (final conflict in conflicts) {
      final localOp = operations.where((op) => op.id == conflict.id).firstOrNull;
      if (localOp == null) continue;

      if (conflict.clientWins) {
        AppLogger.info('[SYNC SERVICE] LWW: client wins for ${conflict.entidad}/${conflict.id}');
        await _database.markOperationConflictResolved(
          conflict.id,
          resolution: 'client_won',
          serverSnapshot: conflict.serverVersion != null
              ? jsonEncode(conflict.serverVersion)
              : null,
        );
        final now = DateTime.now();
        await _database.insertSyncOperation(
          SyncQueueTableCompanion.insert(
            id: _uuid.v4(),
            entidad: conflict.entidad,
            tipo: localOp.tipo,
            payloadJson: localOp.payloadJson,
            createdAt: now,
            updatedAt: now,
            conflictResolution: const Value('client_won_requeue'),
            serverSnapshot: conflict.serverVersion != null
                ? Value(jsonEncode(conflict.serverVersion))
                : const Value(null),
          ),
        );
        _statusService?.refresh();
      } else {
        AppLogger.info('[SYNC SERVICE] LWW: server wins for ${conflict.entidad}/${conflict.id}');
        await _database.markOperationConflictResolved(
          conflict.id,
          resolution: 'server_won',
          serverSnapshot: conflict.serverVersion != null
              ? jsonEncode(conflict.serverVersion)
              : null,
        );
      }
    }
  }

  Future<int> getPendingCount() {
    return _database.getPendingOperationsCount();
  }

  Future<int> getErrorCount() {
    return _database.getErrorOperationsCount();
  }

  Future<void> retryErrors() async {
    final errorOps = await _database.getPendingOperations(limit: _maxBatchSize);
    if (errorOps.isEmpty) {
      final allOps = await _database.getPendingOperations(limit: 100);
      if (allOps.isEmpty) return;
    }
    await syncPending();
  }

  Future<void> clearSent() async {
    await _database.clearSentOperations();
  }
}
