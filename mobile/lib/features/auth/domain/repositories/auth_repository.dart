abstract class AuthRepository {
  /// Placeholder for login operation
  /// TODO: Implement with real authentication logic
  Future<void> login(String email, String password);

  /// Placeholder for logout operation
  /// TODO: Implement with real logout logic
  Future<void> logout();

  /// Placeholder for getting current user session
  /// TODO: Implement session retrieval logic
  Future<String?> getCurrentUser();
}
