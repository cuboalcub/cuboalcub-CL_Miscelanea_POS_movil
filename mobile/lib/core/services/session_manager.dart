import '../../features/auth/domain/entities/auth_result.dart';

class SessionManager {
  AuthResult? _session;

  AuthResult? get session => _session;

  bool get isLoggedIn => _session?.token != null;

  Future<void> saveSession(AuthResult session) async {
    _session = session;
  }

  Future<AuthResult?> getSession() async {
    return _session;
  }

  Future<void> clearSession() async {
    _session = null;
  }
}