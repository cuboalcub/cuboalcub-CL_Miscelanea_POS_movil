import 'package:drift/drift.dart';

class VentaItemsLocalTable extends Table {
  TextColumn get id => text()();
  TextColumn get ventaId => text()();
  TextColumn get productoId => text()();
  TextColumn get productoNombre => text()();
  IntColumn get cantidad => integer()();
  RealColumn get precioUnitario => real()();
  RealColumn get subtotal => real()();

  @override
  Set<Column> get primaryKey => {id};
}
