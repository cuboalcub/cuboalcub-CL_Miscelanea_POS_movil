// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';

import '../app_database.dart';

Future<void> debugSatDatabase(AppDatabase db) async {
  if (!kDebugMode) return;

  print('[SAT DEBUG] DB initialized');

  final count = await db.select(db.sATCatalogItemTable).get();
  print('[SAT DEBUG] Row count: ${count.length}');

  if (count.isEmpty) {
    await db.into(db.sATCatalogItemTable).insert(
          SATCatalogItemTableCompanion.insert(
            id: 'debug-001',
            type: 'debug',
            code: 'TEST',
            description: 'Debug SAT entry',
            updatedAt: DateTime.now(),
          ),
        );
    print('[SAT DEBUG] Inserted test record');
  }

  final rows = await (db.select(db.sATCatalogItemTable)
        ..limit(20))
      .get();
  for (final row in rows) {
    print('[SAT DEBUG] ${row.id} | ${row.type} | ${row.code} | ${row.description}');
  }
}
