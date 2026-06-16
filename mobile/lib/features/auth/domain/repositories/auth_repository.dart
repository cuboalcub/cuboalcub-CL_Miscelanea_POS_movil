import '../entities/auth_result.dart';

abstract class AuthRepository {
  Future<AuthResult> login(String email, String password);

  Future<void> logout();

  Future<AuthResult?> getCurrentUser();
}
