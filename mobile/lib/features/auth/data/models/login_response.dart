class LoginResponse {
  final String token;
  final int empresaId;
  final int usuarioId;

  const LoginResponse({
    required this.token,
    required this.empresaId,
    required this.usuarioId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] as String,
      empresaId: json['perfil']['empresa_id'] as int,
      usuarioId: json['usuario']['id'] as int,
    );
  }
}
