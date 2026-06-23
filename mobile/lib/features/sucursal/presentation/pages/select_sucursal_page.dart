import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../domain/entities/sucursal.dart';
import '../bloc/select_sucursal_bloc.dart';
import '../bloc/select_sucursal_event.dart';
import '../bloc/select_sucursal_state.dart';

class SelectSucursalPage extends StatelessWidget {
  const SelectSucursalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectSucursalBloc(
        sucursalRepository: sl(),
        sessionManager: sl(),
      ),
      child: const _SelectSucursalView(),
    );
  }
}

class _SelectSucursalView extends StatefulWidget {
  const _SelectSucursalView();

  @override
  State<_SelectSucursalView> createState() => _SelectSucursalViewState();
}

class _SelectSucursalViewState extends State<_SelectSucursalView> {
  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      context.read<SelectSucursalBloc>().add(
            LoadSucursales(usuarioId: authState.authResult.usuarioId),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectSucursalBloc, SelectSucursalState>(
      listener: (context, state) {
        if (state is SelectSucursalAutoSelected) {
          context.read<AuthBloc>().add(const AuthSucursalSelected());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Seleccionar sucursal'),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<SelectSucursalBloc, SelectSucursalState>(
          builder: (context, state) {
            if (state is SelectSucursalLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SelectSucursalNone) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.store_outlined,
                        size: 80,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant
                            .withOpacity(0.4),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<AuthBloc>().add(const AuthLogoutRequested());
                        },
                        icon: const Icon(Icons.logout_rounded, size: 18),
                        label: const Text('Cerrar sesión'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is SelectSucursalError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        size: 80,
                        color: Theme.of(context).colorScheme.error.withOpacity(0.6),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        state.failure.message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          final authState = context.read<AuthBloc>().state;
                          if (authState is AuthAuthenticated) {
                            context.read<SelectSucursalBloc>().add(
                                  LoadSucursales(
                                      usuarioId:
                                          authState.authResult.usuarioId),
                                );
                          }
                        },
                        icon: const Icon(Icons.refresh_rounded, size: 18),
                        label: const Text('Reintentar'),
                      ),
                      const SizedBox(height: 12),
                      TextButton.icon(
                        onPressed: () {
                          context
                              .read<AuthBloc>()
                              .add(const AuthLogoutRequested());
                        },
                        icon: const Icon(Icons.logout_rounded, size: 18),
                        label: const Text('Cerrar sesión'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is SelectSucursalLoaded) {
              return _buildSucursalList(context, state.sucursales);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildSucursalList(BuildContext context, List<Sucursal> sucursales) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.storefront_rounded,
                  size: 40,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 8),
                Text(
                  '¿En qué sucursal trabajarás?',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${sucursales.length} sucursales disponibles',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.8),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: sucursales.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final sucursal = sucursales[index];
                return _SucursalCard(
                  sucursal: sucursal,
                  onTap: () {
                    context.read<SelectSucursalBloc>().add(
                          SelectSucursal(
                            sucursalId: sucursal.id,
                            nombre: sucursal.nombre,
                          ),
                        );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SucursalCard extends StatelessWidget {
  final Sucursal sucursal;
  final VoidCallback onTap;

  const _SucursalCard({
    required this.sucursal,
    required this.onTap,
  });

  Color? _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return null;
    try {
      final cleaned = hexColor.replaceFirst('#', '');
      return Color(int.parse('FF$cleaned', radix: 16));
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = _parseColor(sucursal.color);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: accentColor?.withOpacity(0.4) ??
              theme.colorScheme.outline.withOpacity(0.2),
          width: accentColor != null ? 2 : 1,
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
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: accentColor?.withOpacity(0.15) ??
                      theme.colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: sucursal.logoUrl != null && sucursal.logoUrl!.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          sucursal.logoUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.store_rounded,
                            color: accentColor ?? theme.colorScheme.primary,
                            size: 28,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.store_rounded,
                        color: accentColor ?? theme.colorScheme.primary,
                        size: 28,
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sucursal.nombre,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: accentColor,
                      ),
                    ),
                    if (sucursal.direccionCompleta.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              sucursal.direccionCompleta,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (sucursal.encargado.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            size: 14,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              sucursal.encargado,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: accentColor ?? theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
