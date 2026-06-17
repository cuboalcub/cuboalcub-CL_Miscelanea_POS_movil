import 'package:drift/drift.dart';
import 'package:dio/dio.dart';

import '../../../core/database/app_database.dart';

class CatalogSyncResult {
  final String type;
  final String endpoint;
  final int inserted;
  final int updated;
  final int softDeleted;
  final bool success;
  final String? error;

  const CatalogSyncResult({
    required this.type,
    required this.endpoint,
    required this.inserted,
    required this.updated,
    required this.softDeleted,
    required this.success,
    this.error,
  });
}

class SatSyncResult {
  final int totalInserted;
  final int totalUpdated;
  final int totalSoftDeleted;
  final int totalFailed;
  final Duration duration;
  final List<CatalogSyncResult> perCatalogStats;

  const SatSyncResult({
    required this.totalInserted,
    required this.totalUpdated,
    required this.totalSoftDeleted,
    required this.totalFailed,
    required this.duration,
    required this.perCatalogStats,
  });
}

class SATCatalogItemDTO {
  final String code;
  final String description;
  final Map<String, dynamic>? extra;

  const SATCatalogItemDTO({
    required this.code,
    required this.description,
    this.extra,
  });

  factory SATCatalogItemDTO.fromJson(Map<String, dynamic> json) {
    return SATCatalogItemDTO(
      code: json['clave']?.toString() ??
          json['codigo']?.toString() ??
          json['id']?.toString() ??
          '',
      description: json['descripcion']?.toString() ?? json['description']?.toString() ?? '',
      extra: json,
    );
  }

  String toId(String type) => '$type-$code';
}

class SatSyncService {
  final Dio _dio;
  final AppDatabase _database;

  static const _catalogEndpoints = <String, String>{
    'clave_sat': '/sat/claves',
    'regimen_fiscal': '/sat/regimenes-fiscales',
    'exportacion': '/sat/exportacion',
    'tipo_comprobante': '/sat/tipos-comprobante',
    'forma_pago': '/sat/formas-pago',
    'metodo_pago': '/sat/metodos-pago',
    'uso_cfdi': '/sat/usos-cfdi',
    'unidad': '/sat/unidades',
  };

  SatSyncService({required Dio dio, required AppDatabase database})
      : _dio = dio,
        _database = database;

  Future<SatSyncResult> syncAllSatCatalogs() async {
    final stopwatch = Stopwatch()..start();
    print('[SAT SYNC] Starting sync...');

    final results = <CatalogSyncResult>[];

    final futures = _catalogEndpoints.entries.map((entry) async {
      final result = await _syncCatalog(entry.key, entry.value);
      results.add(result);
    });

    await Future.wait(futures);

    stopwatch.stop();

    final totalInserted = results.fold<int>(0, (sum, r) => sum + r.inserted);
    final totalUpdated = results.fold<int>(0, (sum, r) => sum + r.updated);
    final totalSoftDeleted = results.fold<int>(0, (sum, r) => sum + r.softDeleted);
    final totalFailed = results.where((r) => !r.success).length;

    final seconds = stopwatch.elapsedMilliseconds / 1000;
    print('[SAT SYNC] SYNC COMPLETE in ${seconds.toStringAsFixed(1)}s');

    return SatSyncResult(
      totalInserted: totalInserted,
      totalUpdated: totalUpdated,
      totalSoftDeleted: totalSoftDeleted,
      totalFailed: totalFailed,
      duration: stopwatch.elapsed,
      perCatalogStats: results,
    );
  }

  Future<CatalogSyncResult> _syncCatalog(String type, String endpoint) async {
    try {
      print('[SAT SYNC] Fetching $type...');

      final response = await _dio.get<List>(endpoint);
      final items = (response.data ?? [])
          .map((json) => SATCatalogItemDTO.fromJson(json as Map<String, dynamic>))
          .toList();

      print('[SAT SYNC] $type -> ${items.length} items');

      final activeCodes = <String>[];
      final companions = <SATCatalogItemTableCompanion>[];
      final now = DateTime.now();

      for (final item in items) {
        activeCodes.add(item.code);
        companions.add(
          SATCatalogItemTableCompanion(
            id: Value(item.toId(type)),
            type: Value(type),
            code: Value(item.code),
            description: Value(item.description),
            extraJson: Value(item.extra != null ? _encodeJson(item.extra!) : null),
            updatedAt: Value(now),
            deletedAt: const Value(null),
            synced: const Value(true),
          ),
        );
      }

      await _database.upsertSATCatalogItems(companions);

      final existingCodes = await _database.getActiveCodesByType(type);
      final toSoftDelete = existingCodes.where((c) => !activeCodes.contains(c)).toList();

      var softDeleted = 0;
      if (toSoftDelete.isNotEmpty) {
        softDeleted = await _database.softDeleteSATItemsByTypeExceptCodes(type, activeCodes);
      }

      final upsertedCount = companions.length;
      print('[SAT SYNC] $type inserted/updated: $upsertedCount soft-deleted: $softDeleted');

      return CatalogSyncResult(
        type: type,
        endpoint: endpoint,
        inserted: upsertedCount,
        updated: 0,
        softDeleted: softDeleted,
        success: true,
      );
    } catch (e) {
      print('[SAT SYNC] ERROR in $type: $e');
      return CatalogSyncResult(
        type: type,
        endpoint: endpoint,
        inserted: 0,
        updated: 0,
        softDeleted: 0,
        success: false,
        error: e.toString(),
      );
    }
  }

  String _encodeJson(Map<String, dynamic> json) {
    return json.toString();
  }
}
