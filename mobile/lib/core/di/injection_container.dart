import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_config.dart';
import '../database/app_database.dart';
import '../network/dio_logging_interceptor.dart';
import '../services/session_manager.dart';
import '../services/sync_service.dart';
import '../services/sync_status_service.dart';
import '../services/sync_worker.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/products/data/datasources/product_api_service.dart';
import '../../features/products/data/repositories/products_repository_impl.dart';
import '../../features/products/domain/repositories/products_repository.dart';
import '../../features/products/presentation/bloc/search_bloc.dart';
import '../../features/products/presentation/bloc/products_list_bloc.dart';
import '../../features/pos/presentation/bloc/cart_bloc.dart';
import '../../features/ventas/data/datasources/venta_api_service.dart';
import '../../features/ventas/data/repositories/venta_repository_impl.dart';
import '../../features/ventas/domain/repositories/venta_repository.dart';
import '../../features/ventas/presentation/bloc/venta_bloc.dart';
import '../../features/sync/data/sat_sync_service.dart';
import '../../features/sync/data/catalog_sync_service.dart';

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
      () => SessionManager(dio: sl<Dio>()),
    );
  }

  if (!sl.isRegistered<SatSyncService>()) {
    sl.registerLazySingleton<SatSyncService>(
      () => SatSyncService(
        dio: sl<Dio>(),
        database: sl<AppDatabase>(),
      ),
    );
  }

  if (!sl.isRegistered<SharedPreferences>()) {
    sl.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance(),
    );
  }

  if (!sl.isRegistered<CatalogSyncService>()) {
    sl.registerLazySingletonAsync<CatalogSyncService>(
      () async => CatalogSyncService(
        prefs: await sl.getAsync<SharedPreferences>(),
      ),
    );
  }

  if (!sl.isRegistered<SyncService>()) {
    sl.registerLazySingleton<SyncService>(
      () => SyncService(
        database: sl<AppDatabase>(),
        dio: sl<Dio>(),
        sessionManager: sl<SessionManager>(),
        statusService: sl<SyncStatusService>(),
      ),
    );
  }

  if (!sl.isRegistered<SyncStatusService>()) {
    sl.registerLazySingleton<SyncStatusService>(
      () => SyncStatusService(
        database: sl<AppDatabase>(),
      ),
    );
  }

  if (!sl.isRegistered<SyncWorker>()) {
    sl.registerLazySingleton<SyncWorker>(
      () => SyncWorker(),
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

  if (!sl.isRegistered<ProductApiService>()) {
    sl.registerLazySingleton<ProductApiService>(
      () => ProductApiService(
        dio: sl<Dio>(),
        sessionManager: sl<SessionManager>(),
      ),
    );
  }

  if (!sl.isRegistered<ProductsRepository>()) {
    sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(
        database: sl<AppDatabase>(),
        apiService: sl<ProductApiService>(),
      ),
    );
  }

  if (!sl.isRegistered<VentaApiService>()) {
    sl.registerLazySingleton<VentaApiService>(
      () => VentaApiService(
        dio: sl<Dio>(),
        sessionManager: sl<SessionManager>(),
      ),
    );
  }

  if (!sl.isRegistered<VentaRepository>()) {
    sl.registerLazySingleton<VentaRepository>(
      () => VentaRepositoryImpl(
        database: sl<AppDatabase>(),
        ventaApiService: sl<VentaApiService>(),
      ),
    );
  }
}

void _registerBlocs() {
  if (!sl.isRegistered<AuthBloc>()) {
    sl.registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        authRepository: sl<AuthRepository>(),
        satSyncService: sl<SatSyncService>(),
      ),
    );
  }

  sl.registerFactory<SearchBloc>(
    () => SearchBloc(productsRepository: sl<ProductsRepository>()),
  );

  sl.registerFactory<ProductsListBloc>(
    () => ProductsListBloc(productsRepository: sl<ProductsRepository>()),
  );

  sl.registerFactory<CartBloc>(
    () => CartBloc(),
  );

  sl.registerFactory<VentaBloc>(
    () => VentaBloc(
      ventaRepository: sl<VentaRepository>(),
      syncService: sl<SyncService>(),
    ),
  );
}