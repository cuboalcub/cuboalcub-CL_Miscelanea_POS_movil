import 'package:equatable/equatable.dart';

abstract class SelectSucursalEvent extends Equatable {
  const SelectSucursalEvent();

  @override
  List<Object?> get props => [];
}

class LoadSucursales extends SelectSucursalEvent {
  final String usuarioId;

  const LoadSucursales({required this.usuarioId});

  @override
  List<Object?> get props => [usuarioId];
}

class SelectSucursal extends SelectSucursalEvent {
  final String sucursalId;
  final String nombre;

  const SelectSucursal({required this.sucursalId, this.nombre = ''});

  @override
  List<Object?> get props => [sucursalId, nombre];
}
