import 'package:equatable/equatable.dart';

class CreateVentaRequest extends Equatable {
  final String? clienteId;
  final String? sucursalId;
  final String formaPago;
  final String metodoPago;
  final String usoCfdi;
  final List<CreateVentaItemRequest> items;

  const CreateVentaRequest({
    this.clienteId,
    this.sucursalId,
    required this.formaPago,
    required this.metodoPago,
    required this.usoCfdi,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'cliente_id': clienteId,
      'sucursal_id': sucursalId,
      'forma_pago': formaPago,
      'metodo_pago': metodoPago,
      'uso_cfdi': usoCfdi,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [clienteId, sucursalId, formaPago, metodoPago, usoCfdi, items];
}

class CreateVentaItemRequest extends Equatable {
  final String productoId;
  final int cantidad;
  final double precioUnitario;

  const CreateVentaItemRequest({
    required this.productoId,
    required this.cantidad,
    required this.precioUnitario,
  });

  Map<String, dynamic> toJson() {
    return {
      'producto_id': productoId,
      'cantidad': cantidad,
      'precio_unitario': precioUnitario,
    };
  }

  @override
  List<Object?> get props => [productoId, cantidad, precioUnitario];
}
