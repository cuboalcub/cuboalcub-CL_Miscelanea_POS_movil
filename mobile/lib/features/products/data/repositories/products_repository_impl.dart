import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/logger.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/product_api_service.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final AppDatabase _database;
  final ProductApiService _apiService;

  List<Product> _cachedProducts = [];
  DateTime? _lastFetchTime;
  static const _cacheMaxAge = Duration(minutes: 5);

  ProductsRepositoryImpl({
    required AppDatabase database,
    required ProductApiService apiService,
  })  : _database = database,
        _apiService = apiService;

  Future<List<Product>> _fetchProductsFromApi() async {
    if (_cachedProducts.isNotEmpty && _lastFetchTime != null) {
      final age = DateTime.now().difference(_lastFetchTime!);
      if (age < _cacheMaxAge) {
        return _cachedProducts;
      }
    }

    try {
      final models = await _apiService.getProducts();
      _cachedProducts = models.map((m) => m.toEntity()).toList();
      _lastFetchTime = DateTime.now();
      return _cachedProducts;
    } catch (e) {
      AppLogger.error('[PRODUCTS REPO] API fetch failed: $e');
      if (_cachedProducts.isNotEmpty) {
        return _cachedProducts;
      }
      rethrow;
    }
  }

  void invalidateCache() {
    _cachedProducts = [];
    _lastFetchTime = null;
  }

  @override
  Future<List<Product>> getAllProducts() async {
    return _fetchProductsFromApi();
  }

  @override
  Future<Product?> getProductById(String id) async {
    try {
      final products = await _fetchProductsFromApi();
      for (final p in products) {
        if (p.id == id) return p;
      }
      return null;
    } catch (e) {
      return null;
    }
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

    if (normalizedQuery.isEmpty) {
      stopwatch.stop();
      return [];
    }

    try {
      final products = await _fetchProductsFromApi();

      final filtered = products.where((p) {
        final nombre = p.nombre.toLowerCase();
        final barcode = p.codigoBarras?.toLowerCase() ?? '';
        return nombre.contains(normalizedQuery) ||
            barcode.contains(normalizedQuery);
      }).toList();

      filtered.sort((a, b) {
        final aBarcode = a.codigoBarras?.toLowerCase() ?? '';
        final bBarcode = b.codigoBarras?.toLowerCase() ?? '';
        final aNombre = a.nombre.toLowerCase();
        final bNombre = b.nombre.toLowerCase();

        final aBarcodeExact = aBarcode == normalizedQuery;
        final bBarcodeExact = bBarcode == normalizedQuery;
        if (aBarcodeExact && !bBarcodeExact) return -1;
        if (!aBarcodeExact && bBarcodeExact) return 1;

        final aNombreExact = aNombre == normalizedQuery;
        final bNombreExact = bNombre == normalizedQuery;
        if (aNombreExact && !bNombreExact) return -1;
        if (!aNombreExact && bNombreExact) return 1;

        final aBarcodeStarts = aBarcode.startsWith(normalizedQuery);
        final bBarcodeStarts = bBarcode.startsWith(normalizedQuery);
        if (aBarcodeStarts && !bBarcodeStarts) return -1;
        if (!aBarcodeStarts && bBarcodeStarts) return 1;

        final aNombreStarts = aNombre.startsWith(normalizedQuery);
        final bNombreStarts = bNombre.startsWith(normalizedQuery);
        if (aNombreStarts && !bNombreStarts) return -1;
        if (!aNombreStarts && bNombreStarts) return 1;

        return aNombre.compareTo(bNombre);
      });

      stopwatch.stop();
      AppLogger.debug('[PRODUCTS REPO] searchProducts: ${filtered.length} results in ${stopwatch.elapsedMilliseconds}ms');
      return filtered;
    } catch (e) {
      stopwatch.stop();
      AppLogger.error('[PRODUCTS REPO] searchProducts failed: $e');
      rethrow;
    }
  }

  @override
  Future<List<Product>> getProducts({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final allProducts = await _fetchProductsFromApi();
      final activeProducts = allProducts.where((p) => p.activo).toList();
      activeProducts.sort((a, b) => a.nombre.compareTo(b.nombre));

      final start = offset.clamp(0, activeProducts.length);
      final end = (start + limit).clamp(0, activeProducts.length);

      if (start >= activeProducts.length) return [];
      return activeProducts.sublist(start, end);
    } catch (e) {
      AppLogger.error('[PRODUCTS REPO] getProducts failed: $e');
      rethrow;
    }
  }

  @override
  Future<void> syncProductsDelta() async {
    invalidateCache();
  }
}
