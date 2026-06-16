import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/logger.dart';
import '../../../../core/services/session_manager.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SessionManager _sessionManager;

  AuthRepositoryImpl({required SessionManager sessionManager})
      : _sessionManager = sessionManager;

  @override
  Future<void> login(String email, String password) async {
    try {
      // Placeholder implementation
      // TODO: Integrate with Supabase or other data source
      await Future.delayed(const Duration(milliseconds: 500));
      _sessionManager.saveSession(
        token: 'placeholder_token_${DateTime.now().millisecondsSinceEpoch}',
        userId: email.hashCode.toString(),
        email: email,
      );
    } on DioException catch (e) {
      AppLogger.error('Login network error', error: e);
      throw NetworkException(
        e.message ?? 'Network error during login',
        code: 'NETWORK_ERROR',
      );
    } catch (e, stackTrace) {
      AppLogger.error('Login failed', error: e, stackTrace: stackTrace);
      throw AuthException(
        'Login failed: ${e.toString()}',
        code: 'AUTH_ERROR',
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      _sessionManager.clearSession();
    } catch (e, stackTrace) {
      AppLogger.error('Logout failed', error: e, stackTrace: stackTrace);
      throw AuthException(
        'Logout failed: ${e.toString()}',
        code: 'AUTH_ERROR',
      );
    }
  }

  @override
  Future<String?> getCurrentUser() async {
    try {
      return _sessionManager.email;
    } catch (e, stackTrace) {
      AppLogger.error('Get current user failed', error: e, stackTrace: stackTrace);
      throw StorageException(
        'Failed to retrieve current user: ${e.toString()}',
        code: 'STORAGE_ERROR',
      );
    }
  }
}
