import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ristu_intern_challenge/core/shared/error/failures.dart';
import 'package:ristu_intern_challenge/features/auth/data/datasources/auth_local_datasources.dart';
import 'package:ristu_intern_challenge/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:ristu_intern_challenge/features/auth/data/models/request/login_body.dart';
import 'package:ristu_intern_challenge/features/auth/domain/entities/login_entity.dart';
import 'package:ristu_intern_challenge/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  final AuthRemoteDatasource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  @override
  Future<Either<Failure, LoginEntity>> login(LoginBody body) async {
    try {
      final response = await remoteDataSource.login(body);
      final statusCode = response.code;
      final message = response.message;
      await localDataSource.saveStatus(statusCode);
      await localDataSource.saveMessages(message);

      return Right(response);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromJson(e.response!.data as Map<String, dynamic>),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
