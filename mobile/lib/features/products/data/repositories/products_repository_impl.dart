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

  @override
  Future<List<Product>> searchProducts(String query) async {
    final stopwatch = Stopwatch()..start();
    final normalizedQuery = query.trim().toLowerCase();

    print('[SEARCH] query received: "$normalizedQuery"');

    if (normalizedQuery.isEmpty) {
      stopwatch.stop();
      print('[SEARCH] result count: 0');
      print('[SEARCH] duration: ${stopwatch.elapsedMilliseconds}ms');
      return [];
    }

    final lowerQuery = '%$normalizedQuery%';
    final exactQuery = normalizedQuery;

    final nombreLower = CustomExpression<String>(
      'LOWER(nombre)',
    );
    final codigoBarrasLower = CustomExpression<String>(
      'LOWER(codigo_barras)',
    );

    final rows = await (_database.select(_database.productsTable)
          ..where(
            (t) =>
                nombreLower.like(lowerQuery) |
                codigoBarrasLower.like(lowerQuery),
          ))
        .get();

    final products = rows.map(_mapToEntity).toList();

    products.sort((a, b) {
      final aBarcode = a.codigoBarras?.toLowerCase() ?? '';
      final bBarcode = b.codigoBarras?.toLowerCase() ?? '';
      final aNombre = a.nombre.toLowerCase();
      final bNombre = b.nombre.toLowerCase();

      final aBarcodeExact = aBarcode == exactQuery;
      final bBarcodeExact = bBarcode == exactQuery;
      if (aBarcodeExact && !bBarcodeExact) return -1;
      if (!aBarcodeExact && bBarcodeExact) return 1;

      final aNombreExact = aNombre == exactQuery;
      final bNombreExact = bNombre == exactQuery;
      if (aNombreExact && !bNombreExact) return -1;
      if (!aNombreExact && bNombreExact) return 1;

      final aBarcodeStarts = aBarcode.startsWith(exactQuery);
      final bBarcodeStarts = bBarcode.startsWith(exactQuery);
      if (aBarcodeStarts && !bBarcodeStarts) return -1;
      if (!aBarcodeStarts && bBarcodeStarts) return 1;

      final aNombreStarts = aNombre.startsWith(exactQuery);
      final bNombreStarts = bNombre.startsWith(exactQuery);
      if (aNombreStarts && !bNombreStarts) return -1;
      if (!aNombreStarts && bNombreStarts) return 1;

      return aNombre.compareTo(bNombre);
    });

    String matchType = 'contains';
    if (products.isNotEmpty) {
      final first = products.first;
      final firstBarcode = first.codigoBarras?.toLowerCase() ?? '';
      final firstNombre = first.nombre.toLowerCase();
      if (firstBarcode == exactQuery) {
        matchType = 'barcode_exact';
      } else if (firstNombre == exactQuery) {
        matchType = 'name_exact';
      } else if (firstBarcode.startsWith(exactQuery)) {
        matchType = 'barcode_prefix';
      } else if (firstNombre.startsWith(exactQuery)) {
        matchType = 'name_prefix';
      }
    }

    stopwatch.stop();
    print('[SEARCH] result count: ${products.length}');
    print('[SEARCH] match type: $matchType');
    print('[SEARCH] duration: ${stopwatch.elapsedMilliseconds}ms');

    return products;
  }

  @override
  Future<List<Product>> getProducts({
    int limit = 20,
    int offset = 0,
  }) async {
    final rows = await (_database.select(_database.productsTable)
          ..where((t) => t.activo.equals(true))
          ..orderBy([(t) => OrderingTerm.asc(t.nombre)])
          ..limit(limit, offset: offset))
        .get();
    return rows.map(_mapToEntity).toList();
  }

  @override
  Future<void> syncProductsDelta() async {
    // TODO: Implementar cuando el backend exponga el endpoint de delta de productos.
    // Se esperaría recibir los productos modificados desde la última sincronización
    // e insertar/actualizar/eliminar en la tabla local.
    print('[CATALOG SYNC] ProductsRepository.syncProductsDelta called (stub)');
  }
}
