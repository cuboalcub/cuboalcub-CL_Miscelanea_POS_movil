import 'package:equatable/equatable.dart';

import '../../data/models/create_venta_request.dart';

abstract class VentaEvent extends Equatable {
  const VentaEvent();

  @override
  List<Object?> get props => [];
}

class VentaConfirmar extends VentaEvent {
  final String empresaId;
  final String usuarioId;
  final String? sucursalId;
  final String formaPago;
  final String metodoPago;
  final String usoCfdi;
  final List<CreateVentaItemRequest> items;
  final double subtotal;
  final double iva;
  final double total;

  const VentaConfirmar({
    required this.empresaId,
    required this.usuarioId,
    this.sucursalId,
    required this.formaPago,
    required this.metodoPago,
    required this.usoCfdi,
    required this.items,
    required this.subtotal,
    required this.iva,
    required this.total,
  });

  @override
  List<Object?> get props => [
        empresaId, usuarioId, sucursalId,
        formaPago, metodoPago, usoCfdi,
        items, subtotal, iva, total,
      ];
}

class VentaReset extends VentaEvent {
  const VentaReset();
}
