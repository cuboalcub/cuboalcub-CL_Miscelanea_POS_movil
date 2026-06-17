import 'package:drift/drift.dart';

class VentasLocalTable extends Table {
  TextColumn get id => text()();
  TextColumn get empresaId => text()();
  TextColumn get usuarioId => text()();
  TextColumn get sucursalId => text().nullable()();
  TextColumn get formaPago => text()();
  TextColumn get metodoPago => text()();
  TextColumn get usoCfdi => text()();
  RealColumn get subtotal => real()();
  RealColumn get iva => real()();
  RealColumn get total => real()();
  TextColumn get estado => text().withDefault(const Constant('pending'))();
  TextColumn get backendId => text().nullable()();
  TextColumn get payloadJson => text()();
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get syncPending => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}
