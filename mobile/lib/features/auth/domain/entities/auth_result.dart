import 'package:equatable/equatable.dart';

class AuthResult extends Equatable {
  final String token;
  final int empresaId;
  final int usuarioId;

  const AuthResult({
    required this.token,
    required this.empresaId,
    required this.usuarioId,
  });

  @override
  List<Object?> get props => [token, empresaId, usuarioId];
}
