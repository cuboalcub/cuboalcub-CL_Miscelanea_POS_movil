import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/logger.dart';
import '../../../../core/services/session_manager.dart';
import '../models/product_model.dart';

class ProductApiService {
  final Dio _dio;
  final SessionManager _sessionManager;

  ProductApiService({
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

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dio.get(
        '/productos',
        options: Options(headers: _authHeaders),
      );

      final data = response.data;
      if (data is List) {
        return data
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      if (data is Map<String, dynamic> && data.containsKey('productos')) {
        final list = data['productos'] as List;
        return list
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        final list = data['data'] as List;
        return list
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      AppLogger.warning('[PRODUCT API] Unexpected response format: ${data.runtimeType}');
      return [];
    } on DioException catch (e) {
      AppLogger.error('[PRODUCT API] DioException — Status: ${e.response?.statusCode}');
      throw _mapDioException(e);
    } catch (e, stackTrace) {
      AppLogger.error('[PRODUCT API] Unexpected error', error: e, stackTrace: stackTrace);
      throw ServerException(
        'Error al obtener productos: ${e.toString()}',
        code: 'PRODUCTS_ERROR',
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
