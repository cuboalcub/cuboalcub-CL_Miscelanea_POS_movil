import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/products_table.dart';
import 'tables/sat_catalog_item_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ProductsTable, SATCatalogItemTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

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
        },
      );

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
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'tiendita_pos.db'));
    return NativeDatabase(file);
  });
}
