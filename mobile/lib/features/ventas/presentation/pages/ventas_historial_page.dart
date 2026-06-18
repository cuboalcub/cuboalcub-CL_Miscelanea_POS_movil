import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../domain/entities/venta.dart';
import '../bloc/ventas_historial_bloc.dart';
import '../bloc/ventas_historial_event.dart';
import '../bloc/ventas_historial_state.dart';

class VentasHistorialPage extends StatelessWidget {
  const VentasHistorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<VentasHistorialBloc>()..add(const VentasHistorialStarted()),
      child: const _VentasHistorialView(),
    );
  }
}

class _VentasHistorialView extends StatelessWidget {
  const _VentasHistorialView();

  String _formatEstado(String estado) {
    switch (estado) {
      case 'pending':
        return 'Pendiente';
      case 'synced':
        return 'Sincronizada';
      case 'failed':
        return 'Fallida';
      default:
        return estado;
    }
  }

  Color _estadoColor(String estado) {
    switch (estado) {
      case 'pending':
        return Colors.orange;
      case 'synced':
        return Colors.green;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _formaPagoIcon(String formaPago) {
    switch (formaPago) {
      case '01':
        return Icons.money_rounded;
      case '03':
      case '04':
        return Icons.credit_card_rounded;
      case '05':
        return Icons.account_balance_wallet_rounded;
      case '28':
        return Icons.swap_horiz_rounded;
      default:
        return Icons.payment_rounded;
    }
  }

  String _formaPagoNombre(String formaPago) {
    switch (formaPago) {
      case '01':
        return 'Efectivo';
      case '03':
        return 'T. Crédito';
      case '04':
        return 'T. Débito';
      case '05':
        return 'Monedero';
      case '28':
        return 'Transferencia';
      default:
        return formaPago;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de ventas'),
      ),
      body: BlocBuilder<VentasHistorialBloc, VentasHistorialState>(
        builder: (context, state) {
          if (state is VentasHistorialLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is VentasHistorialError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${state.message}', textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<VentasHistorialBloc>().add(const VentasHistorialStarted());
                    },
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          if (state is VentasHistorialEmpty) {
            return const Center(
              child: Text(
                'No hay ventas registradas.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          if (state is VentasHistorialLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<VentasHistorialBloc>().add(const VentasHistorialStarted());
              },
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: const EdgeInsets.all(16),
                itemCount: state.ventas.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final venta = state.ventas[index];
                  return _buildVentaCard(context, venta, theme);
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildVentaCard(BuildContext context, Venta venta, ThemeData theme) {
    final fecha = '${venta.createdAt.day.toString().padLeft(2, '0')}/'
        '${venta.createdAt.month.toString().padLeft(2, '0')}/'
        '${venta.createdAt.year} '
        '${venta.createdAt.hour.toString().padLeft(2, '0')}:'
        '${venta.createdAt.minute.toString().padLeft(2, '0')}';

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _estadoColor(venta.estado).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _formaPagoIcon(venta.formaPago),
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Folio: ${venta.id.substring(0, 8)}...',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        fecha,
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _estadoColor(venta.estado).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _formatEstado(venta.estado),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _estadoColor(venta.estado),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formaPagoNombre(venta.formaPago),
                  style: TextStyle(
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  '\$${venta.total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
