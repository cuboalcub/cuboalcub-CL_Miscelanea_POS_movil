class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, {this.code});
}

class NetworkException extends AppException {
  const NetworkException(super.message, {super.code});
}

class AuthException extends AppException {
  const AuthException(super.message, {super.code});
}

class StorageException extends AppException {
  const StorageException(super.message, {super.code});
}

class ServerException extends AppException {
  const ServerException(super.message, {super.code});
}

class CacheException extends AppException {
  const CacheException(super.message, {super.code});
}
