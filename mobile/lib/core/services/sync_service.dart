import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../../core/database/app_database.dart';
import '../../core/errors/logger.dart';
import '../../core/services/session_manager.dart';

class SyncService {
  final AppDatabase _database;
  final Dio _dio;
  final SessionManager _sessionManager;
  static const _uuid = Uuid();
  static const int _maxBatchSize = 20;
  static const int _maxRetries = 5;

  bool _syncInProgress = false;

  SyncService({
    required AppDatabase database,
    required Dio dio,
    required SessionManager sessionManager,
  })  : _database = database,
        _dio = dio,
        _sessionManager = sessionManager;

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
    AppLogger.info('[SYNC QUEUE] Queued $tipo $entidad');
  }

  Future<int> syncPending() async {
    if (_syncInProgress) {
      AppLogger.info('[SYNC SERVICE] Sync already in progress, skipping');
      return 0;
    }

    _syncInProgress = true;
    int totalSynced = 0;

    try {
      while (true) {
        final operations = await _database.getPendingOperations(
          limit: _maxBatchSize,
        );

        if (operations.isEmpty) break;

        final syncingIds = operations.map((o) => o.id).toList();
        await _database.markOperationsAsSyncing(syncingIds);

        try {
          await _sendBatch(operations);
          await _database.markOperationsAsSent(syncingIds);
          totalSynced += operations.length;
          AppLogger.info('[SYNC SERVICE] Synced ${operations.length} operations');
        } on DioException catch (e) {
          AppLogger.error('[SYNC SERVICE] Batch sync failed: ${e.message}');
          for (final op in operations) {
            if (op.retryCount < _maxRetries) {
              await _database.markOperationAsError(op.id, e.message);
            } else {
              AppLogger.warning('[SYNC SERVICE] Operation ${op.id} exceeded max retries, discarding');
              await _database.markOperationsAsSent([op.id]);
            }
          }
          break;
        } catch (e) {
          AppLogger.error('[SYNC SERVICE] Unexpected error: $e');
          for (final op in operations) {
            await _database.markOperationAsError(op.id, e.toString());
          }
          break;
        }
      }
    } finally {
      _syncInProgress = false;
    }

    return totalSynced;
  }

  Future<void> _sendBatch(List<SyncQueueTableData> operations) async {
    final session = _sessionManager.session;

    final operaciones = operations.map((op) {
      return {
        'tipo': op.tipo,
        'entidad': op.entidad,
        'datos': jsonDecode(op.payloadJson),
        'timestamp': op.createdAt.toIso8601String(),
      };
    }).toList();

    final payload = {
      'operaciones': operaciones,
      'dispositivo_id': session?.usuarioId ?? '',
      'sucursal_id': '',
      'ultimo_sync': DateTime.now().toIso8601String(),
    };

    final headers = <String, String>{};
    if (session?.token != null && session!.token.isNotEmpty) {
      headers['Authorization'] = 'Bearer ${session.token}';
    }

    final response = await _dio.post(
      '/sync',
      data: payload,
      options: Options(headers: headers),
    );

    AppLogger.info('[SYNC SERVICE] /sync response: ${response.statusCode}');
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
