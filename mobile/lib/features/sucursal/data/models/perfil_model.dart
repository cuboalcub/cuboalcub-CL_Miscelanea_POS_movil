import '../../domain/entities/perfil.dart';

class PerfilModel {
  final String id;
  final String usuarioId;
  final String empresaId;
  final String? sucursalId;
  final String nivel;
  final bool activo;

  const PerfilModel({
    required this.id,
    required this.usuarioId,
    required this.empresaId,
    this.sucursalId,
    required this.nivel,
    required this.activo,
  });

  factory PerfilModel.fromJson(Map<String, dynamic> json) {
    String asString(dynamic value) => value?.toString() ?? '';

    return PerfilModel(
      id: asString(json['id']),
      usuarioId: asString(json['usuario_id']),
      empresaId: asString(json['empresa_id']),
      sucursalId: json['sucursal_id']?.toString(),
      nivel: asString(json['nivel']),
      activo: json['activo'] as bool? ?? false,
    );
  }

  Perfil toEntity() => Perfil(
        id: id,
        usuarioId: usuarioId,
        empresaId: empresaId,
        sucursalId: sucursalId,
        nivel: nivel,
        activo: activo,
      );
}
