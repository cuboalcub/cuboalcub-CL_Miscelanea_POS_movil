import 'package:equatable/equatable.dart';

import '../../domain/entities/venta.dart';

abstract class VentasHistorialState extends Equatable {
  const VentasHistorialState();

  @override
  List<Object?> get props => [];
}

class VentasHistorialInitial extends VentasHistorialState {
  const VentasHistorialInitial();
}

class VentasHistorialLoading extends VentasHistorialState {
  const VentasHistorialLoading();
}

class VentasHistorialLoaded extends VentasHistorialState {
  final List<Venta> ventas;

  const VentasHistorialLoaded({required this.ventas});

  @override
  List<Object?> get props => [ventas];
}

class VentasHistorialEmpty extends VentasHistorialState {
  const VentasHistorialEmpty();
}

class VentasHistorialError extends VentasHistorialState {
  final String message;

  const VentasHistorialError({required this.message});

  @override
  List<Object?> get props => [message];
}
