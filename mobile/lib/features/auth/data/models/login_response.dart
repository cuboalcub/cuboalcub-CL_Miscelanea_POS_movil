class LoginResponse {
  final String token;
  final String empresaId;
  final String usuarioId;

  const LoginResponse({
    required this.token,
    required this.empresaId,
    required this.usuarioId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    String asString(dynamic value) => value?.toString() ?? '';

    return LoginResponse(
      token: json['token'] as String? ?? '',
      empresaId: asString(json['perfil']?['empresa_id']),
      usuarioId: asString(json['usuario']?['id']),
    );
  }
}
