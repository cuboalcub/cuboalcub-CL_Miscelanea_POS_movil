import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/error_mapper.dart';
import '../../../../core/errors/logger.dart';
import '../../../sync/data/sat_sync_service.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final SatSyncService _satSyncService;

  AuthBloc({
    required AuthRepository authRepository,
    required SatSyncService satSyncService,
  })  : _authRepository = authRepository,
        _satSyncService = satSyncService,
        super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onAppStarted(
    AppStarted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final session = await _authRepository.getCurrentUser();
      if (session != null) {
        emit(AuthAuthenticated(authResult: session));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final authResult =
          await _authRepository.login(event.email, event.password);
      emit(AuthAuthenticated(authResult: authResult));
      _triggerInitialSatSync();
    } catch (e, stackTrace) {
      AppLogger.error('Login failed', error: e, stackTrace: stackTrace);
      final failure = ErrorMapper.mapError(e);
      emit(AuthError(failure));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _authRepository.logout();
      emit(AuthUnauthenticated());
    } catch (e, stackTrace) {
      AppLogger.error('Logout failed', error: e, stackTrace: stackTrace);
      final failure = ErrorMapper.mapError(e);
      emit(AuthError(failure));
    }
  }

  void _triggerInitialSatSync() {
    print('[SAT SYNC] Triggered after login');
    print('[SAT SYNC] Starting initial catalog sync');
    _satSyncService.syncAllSatCatalogs().then((_) {
      print('[SAT SYNC] Completed initial sync');
    }).catchError((e) {
      print('[SAT SYNC] Error during sync: $e');
    });
  }
}
