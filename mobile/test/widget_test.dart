import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile/features/auth/domain/entities/auth_result.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/pages/login_page.dart';
import 'package:mobile/features/sync/data/sat_sync_service.dart';

class _MockAuthRepository implements AuthRepository {
  @override
  Future<AuthResult> login(String email, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {}

  @override
  Future<AuthResult?> getCurrentUser() async => null;
}

class _MockSatSyncService implements SatSyncService {
  @override
  Future<SatSyncResult> syncAllSatCatalogs() async {
    return const SatSyncResult(
      totalInserted: 0,
      totalUpdated: 0,
      totalSoftDeleted: 0,
      totalFailed: 0,
      duration: Duration.zero,
      perCatalogStats: [],
    );
  }
}

class _MockSessionManager {
  Future<void> saveSession(AuthResult session) async {}
  Future<AuthResult?> getSession() async => null;
  Future<void> clearSession() async {}
}

void main() {
  testWidgets('LoginPage is displayed when unauthenticated', (tester) async {
    final authBloc = AuthBloc(
      authRepository: _MockAuthRepository(),
      satSyncService: _MockSatSyncService(),
      sessionManager: _MockSessionManager() as dynamic,
    );
    authBloc.add(const AppStarted());

    await tester.pumpWidget(
      BlocProvider<AuthBloc>.value(
        value: authBloc,
        child: const MaterialApp(home: LoginPage()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Tiendita POS'), findsOneWidget);
    expect(find.text('Inicia sesión para continuar'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Iniciar Sesión'), findsOneWidget);
  });
}
