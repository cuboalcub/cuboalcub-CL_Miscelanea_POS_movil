import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/logger.dart';
import '../../../../core/services/session_manager.dart';

import '../../domain/entities/auth_result.dart';
import '../../domain/repositories/auth_repository.dart';

import '../models/login_request.dart';
import '../models/login_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final SessionManager _sessionManager;

  AuthRepositoryImpl({
    required Dio dio,
    required SessionManager sessionManager,
  })  : _dio = dio,
        _sessionManager = sessionManager;

  @override
  Future<AuthResult> login(String email, String password) async {
    try {
      final request = LoginRequest(email: email, password: password);

      final response = await _dio.post(
        '/auth/login',
        data: request.toJson(),
      );

      final loginResponse = LoginResponse.fromJson(response.data);

      final authResult = AuthResult(
        token: loginResponse.token,
        empresaId: loginResponse.empresaId,
        usuarioId: loginResponse.usuarioId,
      );

      await _sessionManager.saveSession(authResult);

      return authResult;
    } on DioException catch (e) {
      AppLogger.error('Login network error', error: e);
      throw _mapDioException(e);
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
      await _sessionManager.clearSession();
    } catch (e, stackTrace) {
      AppLogger.error('Logout failed', error: e, stackTrace: stackTrace);
      throw AuthException(
        'Logout failed: ${e.toString()}',
        code: 'AUTH_ERROR',
      );
    }
  }

  @override
  Future<AuthResult?> getCurrentUser() async {
    try {
      return await _sessionManager.getSession();
    } catch (e, stackTrace) {
      AppLogger.error('Get current user failed', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  Exception _mapDioException(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      if (statusCode == 401 || statusCode == 403) {
        return AuthException(
          'Credenciales inválidas',
          code: 'INVALID_CREDENTIALS',
        );
      }
      if (statusCode != null && statusCode >= 500) {
        return ServerException(
          'Error del servidor. Intenta de nuevo.',
          code: 'SERVER_ERROR',
        );
      }
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return NetworkException(
        'Tiempo de espera agotado. Verifica tu conexión.',
        code: 'TIMEOUT',
      );
    }

    if (e.type == DioExceptionType.connectionError) {
      return NetworkException(
        'Error de conexión. Verifica tu conexión a internet.',
        code: 'CONNECTION_ERROR',
      );
    }

    return NetworkException(
      e.message ?? 'Error de red',
      code: 'NETWORK_ERROR',
    );
  }
}