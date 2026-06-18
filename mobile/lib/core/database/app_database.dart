import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/products_table.dart';
import 'tables/sat_catalog_item_table.dart';
import 'tables/ventas_table.dart';
import 'tables/venta_items_table.dart';
import 'tables/sync_queue_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  ProductsTable,
  SATCatalogItemTable,
  VentasLocalTable,
  VentaItemsLocalTable,
  SyncQueueTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(sATCatalogItemTable);
          }
          if (from < 3) {
            await m.createIndex(productsNombre);
            await m.createIndex(productsCodigoBarras);
          }
          if (from < 4) {
            await m.createTable(ventasLocalTable);
            await m.createTable(ventaItemsLocalTable);
          }
          if (from < 5) {
            await m.createTable(syncQueueTable);
          }
          if (from < 6) {
            final columns = await customSelect(
              "PRAGMA table_info(sync_queue_table)",
            ).get();
            final existing = columns.map((c) => c.data['name'] as String).toSet();
            if (!existing.contains('conflict_resolution')) {
              await customStatement(
                'ALTER TABLE sync_queue_table ADD COLUMN conflict_resolution TEXT',
              );
            }
            if (!existing.contains('server_snapshot')) {
              await customStatement(
                'ALTER TABLE sync_queue_table ADD COLUMN server_snapshot TEXT',
              );
            }
          }
          if (from < 7) {
            final columns = await customSelect(
              "PRAGMA table_info(sync_queue_table)",
            ).get();
            final existing = columns.map((c) => c.data['name'] as String).toSet();
            if (!existing.contains('error_code')) {
              await customStatement(
                'ALTER TABLE sync_queue_table ADD COLUMN error_code TEXT',
              );
            }
          }
        },
      );

  // --- SAT Catalog methods ---

  Future<int> upsertSATCatalogItem(SATCatalogItemTableCompanion item) {
    return into(sATCatalogItemTable).insertOnConflictUpdate(item);
  }

  Future<void> upsertSATCatalogItems(List<SATCatalogItemTableCompanion> items) {
    return transaction(() async {
      for (final item in items) {
        await into(sATCatalogItemTable).insertOnConflictUpdate(item);
      }
    });
  }

  Future<int> softDeleteSATItemsByTypeExceptCodes(String type, List<String> activeCodes) {
    final now = DateTime.now();

    return (update(sATCatalogItemTable)
          ..where((t) => t.type.equals(type) & t.deletedAt.isNull())
          ..where((t) => t.code.isNotIn(activeCodes)))
        .write(
      SATCatalogItemTableCompanion(
        deletedAt: Value(now),
        synced: const Value(true),
      ),
    );
  }

  Future<List<String>> getActiveCodesByType(String type) async {
    final query = select(sATCatalogItemTable)
      ..where((t) => t.type.equals(type) & t.deletedAt.isNull());
    final rows = await query.get();
    return rows.map((r) => r.code).toList();
  }

  // --- Ventas local methods ---

  Future<int> insertVentaLocal(VentasLocalTableCompanion venta) {
    return into(ventasLocalTable).insert(venta);
  }

  Future<void> insertVentaItemsLocal(List<VentaItemsLocalTableCompanion> items) {
    return transaction(() async {
      for (final item in items) {
        await into(ventaItemsLocalTable).insert(item);
      }
    });
  }

  Future<void> saveVentaCompleta(
    VentasLocalTableCompanion venta,
    List<VentaItemsLocalTableCompanion> items,
  ) {
    return transaction(() async {
      await into(ventasLocalTable).insert(venta);
      for (final item in items) {
        await into(ventaItemsLocalTable).insert(item);
      }
    });
  }

  Future<List<VentasLocalTableData>> getVentasPendientesSync() {
    return (select(ventasLocalTable)
          ..where((t) => t.syncPending.equals(true))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  Future<VentasLocalTableData?> getVentaLocalById(String id) {
    return (select(ventasLocalTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<VentaItemsLocalTableData>> getVentaItemsByVentaId(String ventaId) {
    return (select(ventaItemsLocalTable)
          ..where((t) => t.ventaId.equals(ventaId)))
        .get();
  }

  Future<void> markVentaSynced(String localId, String backendId) {
    return (update(ventasLocalTable)
          ..where((t) => t.id.equals(localId)))
        .write(
      VentasLocalTableCompanion(
        syncPending: const Value(false),
        estado: const Value('synced'),
        backendId: Value(backendId),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> markVentaFailed(String localId, String? errorMessage) {
    return (update(ventasLocalTable)
          ..where((t) => t.id.equals(localId)))
        .write(
      VentasLocalTableCompanion(
        estado: const Value('failed'),
        errorMessage: Value(errorMessage),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> getVentasPendientesCount() async {
    final query = select(ventasLocalTable)
      ..where((t) => t.syncPending.equals(true));
    final rows = await query.get();
    return rows.length;
  }

  // --- SyncQueue methods ---

  Future<int> insertSyncOperation(SyncQueueTableCompanion operation) {
    return into(syncQueueTable).insert(operation);
  }

  Future<List<SyncQueueTableData>> getPendingOperations({int limit = 20}) {
    return (select(syncQueueTable)
          ..where((t) => t.status.equals('pending'))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)])
          ..limit(limit))
        .get();
  }

  static const _retryableErrorCodes = {
    'NETWORK_ERROR',
    'TIMEOUT',
    '408',
    '500',
    '502',
    '503',
    '504',
    'UNKNOWN',
  };

  Future<List<SyncQueueTableData>> getRetryableOperations({
    int limit = 20,
    int maxRetries = 5,
  }) async {
    final query = select(syncQueueTable)
      ..where((t) =>
          (t.status.equals('pending')) |
          (t.status.equals('error') &
              t.retryCount.isSmallerThanValue(maxRetries) &
              t.errorCode.isIn(_retryableErrorCodes)))
      ..orderBy([(t) => OrderingTerm.asc(t.createdAt)])
      ..limit(limit);
    return query.get();
  }

  Future<void> markOperationsAsSyncing(List<String> ids) {
    return (update(syncQueueTable)
          ..where((t) => t.id.isIn(ids)))
        .write(
      SyncQueueTableCompanion(
        status: const Value('syncing'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> markOperationsAsSent(List<String> ids) {
    return (update(syncQueueTable)
          ..where((t) => t.id.isIn(ids)))
        .write(
      SyncQueueTableCompanion(
        status: const Value('sent'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> markOperationAsError(String id, String? error, {String? errorCode}) async {
    final current = await (select(syncQueueTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    final newRetryCount = (current?.retryCount ?? 0) + 1;

    await (update(syncQueueTable)
          ..where((t) => t.id.equals(id)))
        .write(
      SyncQueueTableCompanion(
        status: const Value('error'),
        lastError: Value(error),
        errorCode: Value(errorCode),
        retryCount: Value(newRetryCount),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<int> getPendingOperationsCount() async {
    final query = select(syncQueueTable)
      ..where((t) => t.status.equals('pending'));
    final rows = await query.get();
    return rows.length;
  }

  Future<void> clearSentOperations() {
    return (delete(syncQueueTable)
          ..where((t) => t.status.equals('sent')))
        .go();
  }

  Future<int> getErrorOperationsCount() async {
    final query = select(syncQueueTable)
      ..where((t) => t.status.equals('error'));
    final rows = await query.get();
    return rows.length;
  }

  Future<void> markOperationConflictResolved(
    String id, {
    required String resolution,
    String? serverSnapshot,
  }) {
    return (update(syncQueueTable)
          ..where((t) => t.id.equals(id)))
        .write(
      SyncQueueTableCompanion(
        conflictResolution: Value(resolution),
        serverSnapshot: Value(serverSnapshot),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'tiendita_pos.db'));
    return NativeDatabase(file);
  });
}
