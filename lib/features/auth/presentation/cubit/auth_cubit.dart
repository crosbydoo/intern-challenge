import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ristu_intern_challenge/features/auth/data/models/request/login_body.dart';
import 'package:ristu_intern_challenge/features/auth/domain/entities/login_entity.dart';

import 'package:ristu_intern_challenge/features/auth/domain/usecases/login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.loginUsecase,
  ) : super(AuthInitial());

  final LoginUsecase loginUsecase;

  Future<void> login(LoginBody body) async {
    emit(AuthLoading());

    final failureOrSuccess = await loginUsecase.call(body);

    failureOrSuccess.fold(
      (error) => emit(AuthFailure(error.message)),
      (data) => emit(AuthLoginSuccess(data)),
    );
  }
}
