import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/logger.dart';
import '../../../../core/services/session_manager.dart';
import '../models/perfil_model.dart';
import '../models/sucursal_model.dart';

class SucursalApiService {
  final Dio _dio;
  final SessionManager _sessionManager;

  SucursalApiService({
    required Dio dio,
    required SessionManager sessionManager,
  })  : _dio = dio,
        _sessionManager = sessionManager;

  Map<String, String> get _authHeaders {
    final token = _sessionManager.session?.token;
    if (token == null || token.isEmpty) {
      return {};
    }
    return {'Authorization': 'Bearer $token'};
  }

  Future<List<PerfilModel>> getPerfilesByUsuario(String usuarioId, {String? empresaId}) async {
    try {
      final queryParams = <String, dynamic>{'usuario_id': usuarioId};
      if (empresaId != null && empresaId.isNotEmpty) {
        queryParams['empresa_id'] = empresaId;
      }

      AppLogger.info('[SUCURSAL API] GET /perfiles with params: $queryParams');

      final response = await _dio.get(
        '/perfiles',
        queryParameters: queryParams,
        options: Options(headers: _authHeaders),
      );

      final data = response.data;
      if (data is List) {
        return data
            .map((json) => PerfilModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      if (data is Map<String, dynamic> && data.containsKey('perfiles')) {
        final list = data['perfiles'] as List;
        return list
            .map((json) => PerfilModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      AppLogger.warning('[SUCURSAL API] Unexpected perfiles response format: ${data.runtimeType}');
      return [];
    } on DioException catch (e) {
      AppLogger.error('[SUCURSAL API] DioException getting perfiles — Status: ${e.response?.statusCode}');
      throw _mapDioException(e);
    } catch (e, stackTrace) {
      AppLogger.error('[SUCURSAL API] Unexpected error getting perfiles', error: e, stackTrace: stackTrace);
      throw ServerException(
        'Error al obtener perfiles: ${e.toString()}',
        code: 'PERFILES_ERROR',
      );
    }
  }

  Future<SucursalModel> getSucursal(String sucursalId) async {
    try {
      final response = await _dio.get(
        '/sucursales/$sucursalId',
        options: Options(headers: _authHeaders),
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        return SucursalModel.fromJson(data);
      }

      AppLogger.warning('[SUCURSAL API] Unexpected sucursal response format: ${data.runtimeType}');
      throw ServerException(
        'Formato de respuesta inesperado',
        code: 'UNEXPECTED_FORMAT',
      );
    } on DioException catch (e) {
      AppLogger.error('[SUCURSAL API] DioException getting sucursal — Status: ${e.response?.statusCode}');
      throw _mapDioException(e);
    } catch (e, stackTrace) {
      AppLogger.error('[SUCURSAL API] Unexpected error getting sucursal', error: e, stackTrace: stackTrace);
      throw ServerException(
        'Error al obtener sucursal: ${e.toString()}',
        code: 'SUCURSAL_ERROR',
      );
    }
  }

  Exception _mapDioException(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      if (statusCode == 401 || statusCode == 403) {
        return AuthException(
          'Sesión expirada. Inicia sesión nuevamente.',
          code: 'UNAUTHORIZED',
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
