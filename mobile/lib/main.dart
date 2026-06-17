import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/app_bloc_observer.dart';
import 'core/config/app_config.dart';
import 'core/database/app_database.dart';
import 'core/database/debug/sat_db_debug_helper.dart';
import 'core/di/injection_container.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';
import 'features/auth/presentation/bloc/auth_state.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/products/presentation/bloc/products_list_bloc.dart';
import 'features/products/presentation/bloc/search_bloc.dart';
import 'features/products/presentation/pages/products_page.dart';
import 'features/pos/presentation/bloc/cart_bloc.dart';
import 'features/pos/presentation/pages/pos_page.dart';
import 'features/sync/data/sat_sync_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appConfig = AppConfig.fromEnvironment();

  setupDependencies(appConfig);

  Bloc.observer = AppBlocObserver();

  /// 🔥 SAT DRIFT DEBUG (solo en desarrollo)
  if (kDebugMode) {
    final db = sl<AppDatabase>();
    await debugSatDatabase(db);
  }

  runApp(
    BlocProvider.value(
      value: sl<AuthBloc>(),
      child: MyApp(appConfig: appConfig),
    ),
  );

  /// Evento inicial de auth
  sl<AuthBloc>().add(const AppStarted());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appConfig});

  final AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appConfig.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return const HomePage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSyncing = false;

  Future<void> _syncNow() async {
    if (_isSyncing) return;

    print('[CACHE INVALIDATION] Manual sync requested');
    setState(() => _isSyncing = true);

    try {
      final satSyncService = sl<SatSyncService>();
      final result = await satSyncService.syncAllSatCatalogs();
      print('[CACHE INVALIDATION] Sync completed');
      print('[CACHE INVALIDATION] Inserted: ${result.totalInserted}, '
          'Updated: ${result.totalUpdated}, '
          'Soft-deleted: ${result.totalSoftDeleted}, '
          'Failed: ${result.totalFailed}');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Sincronización completada. '
              '${result.totalInserted} registros actualizados.',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('[CACHE INVALIDATION] Sync failed: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No fue posible sincronizar los catálogos'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSyncing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiendita POS'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Bienvenido'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider<ProductsListBloc>(
                          create: (_) => sl<ProductsListBloc>(),
                        ),
                        BlocProvider<SearchBloc>(
                          create: (_) => sl<SearchBloc>(),
                        ),
                        BlocProvider<CartBloc>(
                          create: (_) => sl<CartBloc>(),
                        ),
                      ],
                      child: const POSPage(),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.point_of_sale),
              label: const Text('Punto de Venta'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProductsPage()),
                );
              },
              child: const Text('Ver Productos'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _isSyncing ? null : _syncNow,
              icon: _isSyncing
                  ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.sync),
              label: const Text('Sincronizar ahora'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthLogoutRequested());
              },
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}