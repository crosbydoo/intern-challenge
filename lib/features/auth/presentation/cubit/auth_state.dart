part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  const AuthFailure(this.message);

  final String message;
}

final class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess(this.result);

  final LoginEntity result;
}
