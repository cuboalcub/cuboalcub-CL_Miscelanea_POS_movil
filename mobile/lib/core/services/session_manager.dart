class SessionManager {
  String? _token;
  String? _userId;
  String? _email;

  String? get token => _token;
  String? get userId => _userId;
  String? get email => _email;

  bool get isLoggedIn => _token != null;

  void saveSession({
    required String token,
    required String userId,
    required String email,
  }) {
    _token = token;
    _userId = userId;
    _email = email;
  }

  void clearSession() {
    _token = null;
    _userId = null;
    _email = null;
  }
}
