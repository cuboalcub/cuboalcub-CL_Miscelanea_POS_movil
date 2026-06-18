import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/venta_repository.dart';
import 'ventas_historial_event.dart';
import 'ventas_historial_state.dart';

class VentasHistorialBloc extends Bloc<VentasHistorialEvent, VentasHistorialState> {
  final VentaRepository _ventaRepository;

  VentasHistorialBloc({required VentaRepository ventaRepository})
      : _ventaRepository = ventaRepository,
        super(const VentasHistorialInitial()) {
    on<VentasHistorialStarted>(_onStarted);
  }

  Future<void> _onStarted(
    VentasHistorialStarted event,
    Emitter<VentasHistorialState> emit,
  ) async {
    emit(const VentasHistorialLoading());
    try {
      final ventas = await _ventaRepository.getAllVentasLocal();
      if (ventas.isEmpty) {
        emit(const VentasHistorialEmpty());
      } else {
        emit(VentasHistorialLoaded(ventas: ventas));
      }
    } catch (e) {
      emit(VentasHistorialError(message: e.toString()));
    }
  }
}
