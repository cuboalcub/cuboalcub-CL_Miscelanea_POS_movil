import 'package:equatable/equatable.dart';

class Sucursal extends Equatable {
  final String id;
  final String nombre;
  final String direccionCompleta;
  final String telefono;
  final String encargado;
  final String? ubicacion;
  final String? color;
  final String? logoUrl;
  final String? codigoPostal;
  final String? localidad;
  final String? pais;
  final String? estado;
  final String empresaId;

  const Sucursal({
    required this.id,
    required this.nombre,
    required this.direccionCompleta,
    required this.telefono,
    required this.encargado,
    this.ubicacion,
    this.color,
    this.logoUrl,
    this.codigoPostal,
    this.localidad,
    this.pais,
    this.estado,
    required this.empresaId,
  });

  @override
  List<Object?> get props => [
        id,
        nombre,
        direccionCompleta,
        telefono,
        encargado,
        ubicacion,
        color,
        logoUrl,
        codigoPostal,
        localidad,
        pais,
        estado,
        empresaId,
      ];
}
