import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../config/app_config.dart';
import '../database/app_database.dart';
import '../network/dio_logging_interceptor.dart';
import '../services/session_manager.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

import '../../features/products/data/repositories/products_repository_impl.dart';
import '../../features/products/domain/repositories/products_repository.dart';

final sl = GetIt.instance;

void setupDependencies(AppConfig appConfig) {
  _registerAppConfig(appConfig);
  _registerCore();
  _registerDatabase();
  _registerServices();
  _registerRepositories();
  _registerBlocs();
}

void _registerAppConfig(AppConfig appConfig) {
  if (!sl.isRegistered<AppConfig>()) {
    sl.registerSingleton<AppConfig>(appConfig);
  }
}

void _registerCore() {
  if (!sl.isRegistered<Dio>()) {
    sl.registerLazySingleton<Dio>(() {
      final config = sl<AppConfig>();
      final dio = Dio(BaseOptions(
        baseUrl: config.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ));
      dio.interceptors.add(DioLoggingInterceptor());
      return dio;
    });
  }
}

void _registerDatabase() {
  if (!sl.isRegistered<AppDatabase>()) {
    sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  }
}

void _registerServices() {
  if (!sl.isRegistered<SessionManager>()) {
    sl.registerLazySingleton<SessionManager>(
      () => SessionManager(),
    );
  }
}

void _registerRepositories() {
  if (!sl.isRegistered<AuthRepository>()) {
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        dio: sl<Dio>(),
        sessionManager: sl<SessionManager>(),
      ),
    );
  }

  if (!sl.isRegistered<ProductsRepository>()) {
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      database: sl<AppDatabase>(),
    ),
  );
 }
}

void _registerBlocs() {
  if (!sl.isRegistered<AuthBloc>()) {
    sl.registerLazySingleton<AuthBloc>(
      () => AuthBloc(authRepository: sl<AuthRepository>()),
    );
  }
}