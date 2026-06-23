import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/bloc/app_bloc_observer.dart';
import 'core/config/app_config.dart';
import 'core/database/app_database.dart';
import 'core/database/debug/sat_db_debug_helper.dart';
import 'core/di/injection_container.dart';
import 'core/services/session_manager.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';
import 'features/auth/presentation/bloc/auth_state.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/products/presentation/bloc/products_list_bloc.dart';
import 'features/products/presentation/bloc/search_bloc.dart';
import 'features/products/presentation/pages/products_page.dart';
import 'features/pos/presentation/bloc/cart_bloc.dart';
import 'features/ventas/presentation/bloc/venta_bloc.dart';
import 'features/pos/presentation/pages/pos_page.dart';
import 'features/ventas/presentation/pages/ventas_historial_page.dart';
import 'features/sucursal/presentation/pages/select_sucursal_page.dart';
import 'core/services/sync_status_service.dart';
import 'features/sync/data/sat_sync_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final appConfig = AppConfig.fromEnvironment();

  await setupDependencies(appConfig, prefs);

  sl<SyncStatusService>().startMonitoring();

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            if (state.authResult.activeSucursalId.isEmpty) {
              return const SelectSucursalPage();
            }
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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Tiendita POS'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.primary.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.storefront_rounded,
                      size: 48,
                      color: theme.colorScheme.onPrimary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Bienvenido',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '¿Qué deseas hacer hoy?',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onPrimary.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.store_rounded,
                      size: 20,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sucursal actual',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            sl<SessionManager>().sucursalNombre.isNotEmpty
                                ? sl<SessionManager>().sucursalNombre
                                : 'Sin sucursal seleccionada',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: context.read<AuthBloc>(),
                              child: const SelectSucursalPage(),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.swap_horiz_rounded, size: 16),
                      label: const Text('Cambiar'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.point_of_sale_rounded,
                title: 'Punto de Venta',
                subtitle: 'Realizar ventas y cobros',
                onTap: () {
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
                          BlocProvider<VentaBloc>(
                            create: (_) => sl<VentaBloc>(),
                          ),
                        ],
                        child: const POSPage(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.inventory_2_rounded,
                title: 'Productos',
                subtitle: 'Ver catálogo de productos',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProductsPage()),
                  );
                },
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.receipt_long_rounded,
                title: 'Historial de ventas',
                subtitle: 'Ver ventas realizadas',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const VentasHistorialPage()),
                  );
                },
              ),
              const SizedBox(height: 12),
              _MenuCard(
                icon: Icons.sync_rounded,
                title: 'Sincronizar',
                subtitle: _isSyncing ? 'Sincronizando...' : 'Actualizar catálogos SAT',
                onTap: _isSyncing ? null : _syncNow,
                trailing: _isSyncing
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : null,
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthLogoutRequested());
                },
                icon: const Icon(Icons.logout_rounded, size: 18),
                label: const Text('Cerrar sesión'),
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
          ),
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: theme.colorScheme.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
              if (trailing == null)
                Icon(
                  Icons.chevron_right_rounded,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
