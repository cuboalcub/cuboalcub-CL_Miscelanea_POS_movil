import 'package:equatable/equatable.dart';

class VentaItem extends Equatable {
  final String id;
  final String ventaId;
  final String productoId;
  final String productoNombre;
  final int cantidad;
  final double precioUnitario;
  final double subtotal;

  const VentaItem({
    required this.id,
    required this.ventaId,
    required this.productoId,
    required this.productoNombre,
    required this.cantidad,
    required this.precioUnitario,
    required this.subtotal,
  });

  @override
  List<Object?> get props => [
        id, ventaId, productoId, productoNombre,
        cantidad, precioUnitario, subtotal,
      ];
}
