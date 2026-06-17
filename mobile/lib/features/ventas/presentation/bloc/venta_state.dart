import 'package:equatable/equatable.dart';

abstract class VentaState extends Equatable {
  const VentaState();

  @override
  List<Object?> get props => [];
}

class VentaInitial extends VentaState {
  const VentaInitial();
}

class VentaLoading extends VentaState {
  const VentaLoading();
}

class VentaSuccess extends VentaState {
  final String message;
  final bool syncedToBackend;
  final double total;
  final String formaPago;
  final String ventaId;

  const VentaSuccess({
    required this.message,
    required this.syncedToBackend,
    required this.total,
    required this.formaPago,
    required this.ventaId,
  });

  @override
  List<Object?> get props => [message, syncedToBackend, total, formaPago, ventaId];
}

class VentaError extends VentaState {
  final String message;

  const VentaError({required this.message});

  @override
  List<Object?> get props => [message];
}
