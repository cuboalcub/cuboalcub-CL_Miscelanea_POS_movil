import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../config/app_config.dart';
import '../../features/auth/data/datasources/session_manager.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

void setupDependencies(AppConfig appConfig) {
  _registerAppConfig(appConfig);
  _registerCore();
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
      return Dio(BaseOptions(
        baseUrl: config.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ));
    });
  }
  if (!sl.isRegistered<SessionManager>()) {
    sl.registerLazySingleton<SessionManager>(() => SessionManager());
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
}

void _registerBlocs() {
  if (!sl.isRegistered<AuthBloc>()) {
    sl.registerLazySingleton<AuthBloc>(
      () => AuthBloc(authRepository: sl<AuthRepository>()),
    );
  }
}
