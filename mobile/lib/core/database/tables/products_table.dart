import 'package:drift/drift.dart';

@TableIndex(name: 'products_nombre', columns: {#nombre})
@TableIndex(name: 'products_codigo_barras', columns: {#codigoBarras})
class ProductsTable extends Table {
  TextColumn get id => text()();
  TextColumn? get sku => text().nullable()();
  TextColumn? get codigoBarras => text().nullable()();
  TextColumn get nombre => text()();
  TextColumn? get descripcion => text().nullable()();
  RealColumn get precioVenta => real()();
  RealColumn get precioCompra => real()();
  TextColumn? get satClave => text().nullable()();
  TextColumn? get satUnidad => text().nullable()();
  TextColumn? get categoriaId => text().nullable()();
  BoolColumn get ivaIncluido => boolean()();
  BoolColumn get activo => boolean()();
  TextColumn get empresaId => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get syncPending => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
