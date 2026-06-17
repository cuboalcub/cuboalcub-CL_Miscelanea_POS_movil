import 'package:equatable/equatable.dart';

class Venta extends Equatable {
  final String id;
  final String empresaId;
  final String usuarioId;
  final String? sucursalId;
  final String formaPago;
  final String metodoPago;
  final String usoCfdi;
  final double subtotal;
  final double iva;
  final double total;
  final String estado;
  final String? backendId;
  final String? errorMessage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool syncPending;

  const Venta({
    required this.id,
    required this.empresaId,
    required this.usuarioId,
    this.sucursalId,
    required this.formaPago,
    required this.metodoPago,
    required this.usoCfdi,
    required this.subtotal,
    required this.iva,
    required this.total,
    this.estado = 'pending',
    this.backendId,
    this.errorMessage,
    required this.createdAt,
    required this.updatedAt,
    this.syncPending = true,
  });

  @override
  List<Object?> get props => [
        id, empresaId, usuarioId, sucursalId,
        formaPago, metodoPago, usoCfdi,
        subtotal, iva, total,
        estado, backendId, errorMessage,
        createdAt, updatedAt, syncPending,
      ];
}
