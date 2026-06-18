import 'package:drift/drift.dart';

@TableIndex(name: 'sync_queue_status', columns: {#status})
@TableIndex(name: 'sync_queue_entidad_status', columns: {#entidad, #status})
class SyncQueueTable extends Table {
  TextColumn get id => text()();
  TextColumn get entidad => text()();
  TextColumn get tipo => text()();
  TextColumn get payloadJson => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get lastError => text().nullable()();
  TextColumn get errorCode => text().nullable()();
  TextColumn get conflictResolution => text().nullable()();
  TextColumn get serverSnapshot => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
