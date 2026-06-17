import 'package:drift/drift.dart';

@TableIndex(name: 'sat_catalog_item_type_desc', columns: {#type, #description})
class SATCatalogItemTable extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get code => text()();
  TextColumn get description => text()();
  TextColumn? get extraJson => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn? get deletedAt => dateTime().nullable()();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
