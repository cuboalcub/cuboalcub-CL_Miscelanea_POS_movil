import 'package:dio/dio.dart';

import '../config/app_config.dart';
import '../di/injection_container.dart';
import '../errors/logger.dart';

class DioLoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final config = sl.isRegistered<AppConfig>() ? sl<AppConfig>() : null;
    if (config != null && !config.enableDebugLogging) {
      return handler.next(options);
    }

    final uri = '${options.baseUrl}${options.path}';
    AppLogger.info('[DIO] --> ${options.method} $uri');

    if (options.data != null) {
      AppLogger.debug('[DIO] Body: ${options.data}');
    }
    AppLogger.debug('[DIO] Headers: ${options.headers}');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final config = sl.isRegistered<AppConfig>() ? sl<AppConfig>() : null;
    if (config != null && !config.enableDebugLogging) {
      return handler.next(response);
    }

    final uri = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    AppLogger.info('[DIO] <-- ${response.statusCode} $uri');
    AppLogger.debug('[DIO] Response body: ${response.data}');

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final config = sl.isRegistered<AppConfig>() ? sl<AppConfig>() : null;
    if (config != null && !config.enableDebugLogging) {
      return handler.next(err);
    }

    final uri = '${err.requestOptions.baseUrl}${err.requestOptions.path}';
    AppLogger.error('[DIO] ERROR $uri');
    AppLogger.error('[DIO] Status: ${err.response?.statusCode}');
    AppLogger.error('[DIO] Data: ${err.response?.data}');

    if (err.response != null) {
      AppLogger.error('[DIO] Response headers: ${err.response?.headers}');
    }

    handler.next(err);
  }
}
