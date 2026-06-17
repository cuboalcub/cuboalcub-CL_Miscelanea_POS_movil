import '../../domain/entities/product.dart';

class ProductModel {
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

  const ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?.toString() ?? '',
      sku: json['sku']?.toString(),
      codigoBarras: json['codigo_barras']?.toString() ?? json['codigoBarras']?.toString(),
      nombre: json['nombre']?.toString() ?? '',
      descripcion: json['descripcion']?.toString(),
      precioVenta: _parseDouble(json['precio_venta'] ?? json['precioVenta']),
      precioCompra: _parseDouble(json['precio_compra'] ?? json['precioCompra']),
      satClave: json['sat_clave']?.toString() ?? json['satClave']?.toString(),
      satUnidad: json['sat_unidad']?.toString() ?? json['satUnidad']?.toString(),
      categoriaId: json['categoria_id']?.toString() ?? json['categoriaId']?.toString(),
      ivaIncluido: _parseBool(json['iva_incluido'] ?? json['ivaIncluido']),
      activo: _parseBool(json['activo']),
      empresaId: json['empresa_id']?.toString() ?? json['empresaId']?.toString() ?? '',
      createdAt: _parseDateTime(json['created_at'] ?? json['createdAt']),
      updatedAt: _parseDateTime(json['updated_at'] ?? json['updatedAt']),
      syncPending: _parseBool(json['sync_pending'] ?? json['syncPending']),
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      sku: sku,
      codigoBarras: codigoBarras,
      nombre: nombre,
      descripcion: descripcion,
      precioVenta: precioVenta,
      precioCompra: precioCompra,
      satClave: satClave,
      satUnidad: satUnidad,
      categoriaId: categoriaId,
      ivaIncluido: ivaIncluido,
      activo: activo,
      empresaId: empresaId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      syncPending: syncPending,
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  static bool _parseBool(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;
    if (value is int) return value != 0;
    if (value is String) return value.toLowerCase() == 'true' || value == '1';
    return false;
  }

  static DateTime _parseDateTime(dynamic value) {
    if (value == null) return DateTime.now();
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
    return DateTime.now();
  }
}
