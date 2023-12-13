import 'package:dartz/dartz.dart';
import 'package:ristu_intern_challenge/core/shared/error/failures.dart';
import 'package:ristu_intern_challenge/core/usecase/use_case.dart';
import 'package:ristu_intern_challenge/features/auth/data/models/request/login_body.dart';
import 'package:ristu_intern_challenge/features/auth/domain/entities/login_entity.dart';
import 'package:ristu_intern_challenge/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase extends UseCase<LoginEntity, LoginBody> {
  LoginUsecase(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, LoginEntity>> call(LoginBody params) {
    return repository.login(params);
  }
}
