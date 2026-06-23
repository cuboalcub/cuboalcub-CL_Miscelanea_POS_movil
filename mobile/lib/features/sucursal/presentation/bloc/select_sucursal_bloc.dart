import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/error_mapper.dart';
import '../../../../core/errors/logger.dart';
import '../../../../core/services/session_manager.dart';
import '../../../auth/domain/entities/auth_result.dart';
import '../../domain/entities/sucursal.dart';
import '../../domain/repositories/sucursal_repository.dart';
import 'select_sucursal_event.dart';
import 'select_sucursal_state.dart';

class SelectSucursalBloc
    extends Bloc<SelectSucursalEvent, SelectSucursalState> {
  final SucursalRepository _sucursalRepository;
  final SessionManager _sessionManager;

  SelectSucursalBloc({
    required SucursalRepository sucursalRepository,
    required SessionManager sessionManager,
  })  : _sucursalRepository = sucursalRepository,
        _sessionManager = sessionManager,
        super(SelectSucursalInitial()) {
    on<LoadSucursales>(_onLoadSucursales);
    on<SelectSucursal>(_onSelectSucursal);
  }

  Future<void> _onLoadSucursales(
    LoadSucursales event,
    Emitter<SelectSucursalState> emit,
  ) async {
    emit(SelectSucursalLoading());
    try {
      final empresaId = _sessionManager.session?.empresaId;
      final sucursales =
          await _sucursalRepository.getSucursalesByUsuario(event.usuarioId, empresaId: empresaId);

      if (sucursales.isEmpty) {
        emit(const SelectSucursalNone(
          message: 'No tienes sucursales asignadas. Contacta al administrador.',
        ));
        return;
      }

      emit(SelectSucursalLoaded(sucursales: sucursales));
    } catch (e, stackTrace) {
      AppLogger.error('[SELECT SUCURSAL] Error loading sucursales',
          error: e, stackTrace: stackTrace);
      final failure = ErrorMapper.mapError(e);
      emit(SelectSucursalError(failure));
    }
  }

  Future<void> _onSelectSucursal(
    SelectSucursal event,
    Emitter<SelectSucursalState> emit,
  ) async {
    try {
      await _sessionManager.saveActiveSucursalId(
        event.sucursalId,
        nombre: event.nombre,
      );
      final currentSession = _sessionManager.session;
      if (currentSession != null) {
        final updatedSession = AuthResult(
          token: currentSession.token,
          empresaId: currentSession.empresaId,
          usuarioId: currentSession.usuarioId,
          activeSucursalId: event.sucursalId,
        );
        await _sessionManager.saveSession(updatedSession);
      }
      emit(SelectSucursalAutoSelected(
        sucursal: Sucursal(
          id: event.sucursalId,
          nombre: event.nombre,
          direccionCompleta: '',
          telefono: '',
          encargado: '',
          empresaId: '',
        ),
      ));
    } catch (e, stackTrace) {
      AppLogger.error('[SELECT SUCURSAL] Error selecting sucursal',
          error: e, stackTrace: stackTrace);
    }
  }
}
