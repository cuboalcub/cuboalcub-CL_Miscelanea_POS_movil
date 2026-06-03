import 'failure.dart';
import 'exceptions.dart';

class ErrorMapper {
  static Failure map(Exception exception) {
    if (exception is AuthException) {
      return AuthFailure(
        message: exception.message,
        code: exception.code,
      );
    }
    if (exception is NetworkException) {
      return NetworkFailure(
        message: exception.message,
        code: exception.code,
      );
    }
    if (exception is ServerException) {
      return ServerFailure(
        message: exception.message,
        code: exception.code,
      );
    }
    if (exception is StorageException) {
      return StorageFailure(
        message: exception.message,
        code: exception.code,
      );
    }
    if (exception is CacheException) {
      return StorageFailure(
        message: exception.message,
        code: exception.code,
      );
    }
    return UnknownFailure(
      message: exception.toString(),
    );
  }

  static Failure mapError(Object error) {
    if (error is Exception) {
      return map(error);
    }
    return UnknownFailure(message: error.toString());
  }
}
