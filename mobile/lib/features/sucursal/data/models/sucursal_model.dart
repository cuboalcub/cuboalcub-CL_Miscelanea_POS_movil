import '../../domain/entities/sucursal.dart';

class SucursalModel {
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

  const SucursalModel({
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

  factory SucursalModel.fromJson(Map<String, dynamic> json) {
    String asString(dynamic value) => value?.toString() ?? '';

    return SucursalModel(
      id: asString(json['id']),
      nombre: asString(json['nombre']),
      direccionCompleta: asString(json['direccion_completa']),
      telefono: asString(json['telefono']),
      encargado: asString(json['encargado']),
      ubicacion: json['ubicacion']?.toString(),
      color: json['color']?.toString(),
      logoUrl: json['logo_url']?.toString(),
      codigoPostal: json['codigo_postal']?.toString(),
      localidad: json['localidad']?.toString(),
      pais: json['pais']?.toString(),
      estado: json['estado']?.toString(),
      empresaId: asString(json['empresa_id']),
    );
  }

  Sucursal toEntity() => Sucursal(
        id: id,
        nombre: nombre,
        direccionCompleta: direccionCompleta,
        telefono: telefono,
        encargado: encargado,
        ubicacion: ubicacion,
        color: color,
        logoUrl: logoUrl,
        codigoPostal: codigoPostal,
        localidad: localidad,
        pais: pais,
        estado: estado,
        empresaId: empresaId,
      );
}
