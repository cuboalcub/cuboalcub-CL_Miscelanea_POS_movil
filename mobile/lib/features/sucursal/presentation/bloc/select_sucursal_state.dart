import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/sucursal.dart';

abstract class SelectSucursalState extends Equatable {
  const SelectSucursalState();

  @override
  List<Object?> get props => [];
}

class SelectSucursalInitial extends SelectSucursalState {}

class SelectSucursalLoading extends SelectSucursalState {}

class SelectSucursalLoaded extends SelectSucursalState {
  final List<Sucursal> sucursales;

  const SelectSucursalLoaded({required this.sucursales});

  @override
  List<Object?> get props => [sucursales];
}

class SelectSucursalAutoSelected extends SelectSucursalState {
  final Sucursal sucursal;

  const SelectSucursalAutoSelected({required this.sucursal});

  @override
  List<Object?> get props => [sucursal];
}

class SelectSucursalNone extends SelectSucursalState {
  final String message;

  const SelectSucursalNone({required this.message});

  @override
  List<Object?> get props => [message];
}

class SelectSucursalError extends SelectSucursalState {
  final Failure failure;

  const SelectSucursalError(this.failure);

  @override
  List<Object?> get props => [failure];
}
