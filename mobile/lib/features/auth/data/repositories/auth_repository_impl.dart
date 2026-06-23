// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/logger.dart';
import '../../../../core/services/session_manager.dart';

import '../../domain/entities/auth_result.dart';
import '../../domain/repositories/auth_repository.dart';

import '../models/login_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final SessionManager _sessionManager;

  AuthRepositoryImpl({
    required Dio dio,
    required SessionManager sessionManager,
  })  : _dio = dio,
        _sessionManager = sessionManager;

  /// Temporary debug method — raw Dio call with no abstractions.
  /// Bypasses repository, bloc, session manager, error mappers.
  Future<void> debugLoginRaw(String email, String password) async {
    final url = '${_dio.options.baseUrl}/auth/login';
    final payload = {'email': email, 'password': password};

    print('═══════════════════════════════════════════');
    print('DEBUG LOGIN RAW');
    print('URL: $url');
    print('PAYLOAD: $payload');
    print('═══════════════════════════════════════════');

    try {
      final response = await _dio.post('/auth/login', data: payload);

      print('═══════════════════════════════════════════');
      print('STATUS: ${response.statusCode}');
      print('HEADERS: ${response.headers}');
      print('BODY: ${response.data}');
      print('═══════════════════════════════════════════');
    } on DioException catch (e) {
      print('═══════════════════════════════════════════');
      print('DIO EXCEPTION');
      print('TYPE: ${e.type}');
      print('STATUS: ${e.response?.statusCode}');
      print('BODY: ${e.response?.data}');
      print('MESSAGE: ${e.message}');
      print('═══════════════════════════════════════════');
    } catch (e, st) {
      print('═══════════════════════════════════════════');
      print('UNEXPECTED ERROR: $e');
      print('STACK: $st');
      print('═══════════════════════════════════════════');
    }
  }

  @override
  Future<AuthResult> login(String email, String password) async {
    try {
      final url = '${_dio.options.baseUrl}/auth/login';
      final payload = {'email': email, 'password': password};

      AppLogger.info('[AUTH] Resolved URL: $url');
      AppLogger.debug('[AUTH] Payload: $payload');

      final response = await _dio.post('/auth/login', data: payload);

      AppLogger.info('[AUTH] Response status: ${response.statusCode}');
      AppLogger.info('[AUTH] Response body: ${response.data}');

      final loginResponse = LoginResponse.fromJson(response.data);

      final authResult = AuthResult(
        token: loginResponse.token,
        empresaId: loginResponse.empresaId,
        usuarioId: loginResponse.usuarioId,
        activeSucursalId: loginResponse.sucursalId,
      );

      await _sessionManager.saveSession(authResult);

      AppLogger.info('[AUTH] Login successful for: $email');

      return authResult;
    } on DioException catch (e) {
      AppLogger.error('[AUTH] DioException — Status: ${e.response?.statusCode}, URL: ${e.requestOptions.baseUrl}${e.requestOptions.path}');
      AppLogger.error('[AUTH] Response body: ${e.response?.data}');
      AppLogger.error('[AUTH] Request data: ${e.requestOptions.data}');
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