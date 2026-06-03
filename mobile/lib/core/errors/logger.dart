import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error }

class AppLogger {
  static void log(
    String message, {
    LogLevel level = LogLevel.debug,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final prefix = '[${level.name.toUpperCase()}]';
    final output = '$prefix $message';
    if (error != null) {
      debugPrint('$output\nError: $error');
    } else {
      debugPrint(output);
    }
    if (stackTrace != null) {
      debugPrint('StackTrace: $stackTrace');
    }
  }

  static void debug(String message) => log(message);

  static void info(String message) => log(message, level: LogLevel.info);

  static void warning(String message, {Object? error, StackTrace? stackTrace}) =>
      log(message, level: LogLevel.warning, error: error, stackTrace: stackTrace);

  static void error(String message, {Object? error, StackTrace? stackTrace}) =>
      log(message, level: LogLevel.error, error: error, stackTrace: stackTrace);
}
