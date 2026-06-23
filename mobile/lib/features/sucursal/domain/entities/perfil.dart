import 'package:equatable/equatable.dart';

class Perfil extends Equatable {
  final String id;
  final String usuarioId;
  final String empresaId;
  final String? sucursalId;
  final String nivel;
  final bool activo;

  const Perfil({
    required this.id,
    required this.usuarioId,
    required this.empresaId,
    this.sucursalId,
    required this.nivel,
    required this.activo,
  });

  @override
  List<Object?> get props => [id, usuarioId, empresaId, sucursalId, nivel, activo];
}
