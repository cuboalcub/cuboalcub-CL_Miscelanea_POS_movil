import '../entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getAllProducts();
  Future<Product?> getProductById(String id);
  Future<void> insertProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
  Future<List<Product>> getPendingSyncProducts();
  Future<void> markAsSynced(String id);
}
