import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

void setupDependencies() {
  _registerBlocs();
}

void _registerBlocs() {
  if (!sl.isRegistered<AuthBloc>()) {
    sl.registerLazySingleton<AuthBloc>(() => AuthBloc());
  }
}
