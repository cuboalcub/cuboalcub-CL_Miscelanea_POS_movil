import 'package:get_it/get_it.dart';

import '../config/app_config.dart';
import '../services/session_manager.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

void setupDependencies(AppConfig appConfig) {
  _registerAppConfig(appConfig);
  _registerServices();
  _registerRepositories();
  _registerBlocs();
}

void _registerAppConfig(AppConfig appConfig) {
  if (!sl.isRegistered<AppConfig>()) {
    sl.registerSingleton<AppConfig>(appConfig);
  }
}

void _registerServices() {
  if (!sl.isRegistered<SessionManager>()) {
    sl.registerLazySingleton<SessionManager>(() => SessionManager());
  }
}

void _registerRepositories() {
  if (!sl.isRegistered<AuthRepository>()) {
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sessionManager: sl<SessionManager>()),
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
