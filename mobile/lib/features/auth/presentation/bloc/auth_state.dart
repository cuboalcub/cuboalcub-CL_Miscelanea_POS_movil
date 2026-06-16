import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/auth_result.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final AuthResult authResult;

  const AuthAuthenticated({required this.authResult});

  @override
  List<Object?> get props => [authResult];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final Failure failure;

  const AuthError(this.failure);

  @override
  List<Object?> get props => [failure];
}
