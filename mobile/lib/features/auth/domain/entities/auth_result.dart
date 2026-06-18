import 'package:equatable/equatable.dart';

class AuthResult extends Equatable {
  final String token;
  final String empresaId;
  final String usuarioId;
  final String activeSucursalId;

  const AuthResult({
    required this.token,
    required this.empresaId,
    required this.usuarioId,
    required this.activeSucursalId,
  });

  @override
  List<Object?> get props => [token, empresaId, usuarioId, activeSucursalId];
}
