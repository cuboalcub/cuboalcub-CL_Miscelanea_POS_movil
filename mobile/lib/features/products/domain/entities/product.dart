class Product {
  final String id;
  final String? sku;
  final String? codigoBarras;
  final String nombre;
  final String? descripcion;
  final double precioVenta;
  final double precioCompra;
  final String? satClave;
  final String? satUnidad;
  final String? categoriaId;
  final bool ivaIncluido;
  final bool activo;
  final String empresaId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool syncPending;

  const Product({
    required this.id,
    this.sku,
    this.codigoBarras,
    required this.nombre,
    this.descripcion,
    required this.precioVenta,
    required this.precioCompra,
    this.satClave,
    this.satUnidad,
    this.categoriaId,
    required this.ivaIncluido,
    required this.activo,
    required this.empresaId,
    required this.createdAt,
    required this.updatedAt,
    this.syncPending = false,
  });
}
