import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/logger.dart';
import '../../../../core/services/sync_service.dart';
import '../../domain/repositories/venta_repository.dart';
import 'venta_event.dart';
import 'venta_state.dart';

class VentaBloc extends Bloc<VentaEvent, VentaState> {
  final VentaRepository _ventaRepository;
  final SyncService _syncService;

  VentaBloc({
    required VentaRepository ventaRepository,
    required SyncService syncService,
  })  : _ventaRepository = ventaRepository,
        _syncService = syncService,
        super(const VentaInitial()) {
    on<VentaConfirmar>(_onConfirmar);
    on<VentaReset>(_onReset);
  }

  Future<void> _onConfirmar(
    VentaConfirmar event,
    Emitter<VentaState> emit,
  ) async {
    emit(const VentaLoading());

    try {
      final ventaId = await _ventaRepository.confirmarVenta(
        empresaId: event.empresaId,
        usuarioId: event.usuarioId,
        sucursalId: event.sucursalId,
        formaPago: event.formaPago,
        metodoPago: event.metodoPago,
        usoCfdi: event.usoCfdi,
        items: event.items,
        subtotal: event.subtotal,
        iva: event.iva,
        total: event.total,
      );

      emit(VentaSuccess(
        message: 'Venta registrada y encolada para sincronizar',
        syncedToBackend: false,
        total: event.total,
        formaPago: event.formaPago,
        ventaId: ventaId,
      ));

      _syncService.syncPending().then((synced) {
        if (synced > 0) {
          AppLogger.info('[VENTA BLOC] Background sync completed: $synced ops');
        }
      }).catchError((e) {
        AppLogger.warning('[VENTA BLOC] Background sync failed: $e');
      });
    } catch (e) {
      AppLogger.error('[VENTA BLOC] Error confirming venta: $e');
      emit(const VentaError(
        message: 'No se pudo registrar la venta',
      ));
    }
  }

  void _onReset(VentaReset event, Emitter<VentaState> emit) {
    emit(const VentaInitial());
  }
}
