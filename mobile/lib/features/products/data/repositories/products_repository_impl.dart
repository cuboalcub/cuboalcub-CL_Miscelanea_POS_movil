import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final AppDatabase _database;

  ProductsRepositoryImpl({required AppDatabase database})
      : _database = database;

  @override
  Future<List<Product>> getAllProducts() async {
    final rows = await _database.select(_database.productsTable).get();
    return rows.map(_mapToEntity).toList();
  }

  @override
  Future<Product?> getProductById(String id) async {
    final row = await (_database.select(_database.productsTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row != null ? _mapToEntity(row) : null;
  }

  @override
  Future<void> insertProduct(Product product) async {
    await _database.into(_database.productsTable).insert(
          ProductsTableCompanion.insert(
            id: product.id,
            sku: Value(product.sku),
            codigoBarras: Value(product.codigoBarras),
            nombre: product.nombre,
            descripcion: Value(product.descripcion),
            precioVenta: product.precioVenta,
            precioCompra: product.precioCompra,
            satClave: Value(product.satClave),
            satUnidad: Value(product.satUnidad),
            categoriaId: Value(product.categoriaId),
            ivaIncluido: product.ivaIncluido,
            activo: product.activo,
            empresaId: product.empresaId,
            createdAt: product.createdAt,
            updatedAt: product.updatedAt,
            syncPending: Value(product.syncPending),
          ),
        );
  }

  @override
  Future<void> updateProduct(Product product) async {
    await (_database.update(_database.productsTable)
          ..where((t) => t.id.equals(product.id)))
        .write(
          ProductsTableCompanion(
            sku: Value(product.sku),
            codigoBarras: Value(product.codigoBarras),
            nombre: Value(product.nombre),
            descripcion: Value(product.descripcion),
            precioVenta: Value(product.precioVenta),
            precioCompra: Value(product.precioCompra),
            satClave: Value(product.satClave),
            satUnidad: Value(product.satUnidad),
            categoriaId: Value(product.categoriaId),
            ivaIncluido: Value(product.ivaIncluido),
            activo: Value(product.activo),
            empresaId: Value(product.empresaId),
            createdAt: Value(product.createdAt),
            updatedAt: Value(product.updatedAt),
            syncPending: Value(product.syncPending),
          ),
        );
  }

  @override
  Future<void> deleteProduct(String id) async {
    await (_database.delete(_database.productsTable)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Future<List<Product>> getPendingSyncProducts() async {
    final rows = await (_database.select(_database.productsTable)
          ..where((t) => t.syncPending.equals(true)))
        .get();
    return rows.map(_mapToEntity).toList();
  }

  @override
  Future<void> markAsSynced(String id) async {
    await (_database.update(_database.productsTable)
          ..where((t) => t.id.equals(id)))
        .write(const ProductsTableCompanion(syncPending: Value(false)));
  }

  Product _mapToEntity(ProductsTableData row) {
    return Product(
      id: row.id,
      sku: row.sku,
      codigoBarras: row.codigoBarras,
      nombre: row.nombre,
      descripcion: row.descripcion,
      precioVenta: row.precioVenta,
      precioCompra: row.precioCompra,
      satClave: row.satClave,
      satUnidad: row.satUnidad,
      categoriaId: row.categoriaId,
      ivaIncluido: row.ivaIncluido,
      activo: row.activo,
      empresaId: row.empresaId,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      syncPending: row.syncPending,
    );
  }
}
