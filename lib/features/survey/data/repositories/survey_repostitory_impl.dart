import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:ristu_intern_challenge/core/shared/error/failures.dart';
import 'package:ristu_intern_challenge/core/usecase/use_case.dart';
import 'package:ristu_intern_challenge/features/survey/data/datasources/survey_remote_datasources.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/survey_entity.dart';
import 'package:ristu_intern_challenge/features/survey/domain/repositories/survey_repository.dart';

class SurveyRepositoryImpl implements SurveyRepository {
  SurveyRepositoryImpl(
    this.remoteDataSource,
  );

  final SurveyRemoteDatasource remoteDataSource;

  @override
  Future<Either<Failure, SurveyEntity>> getSurvey(NoParams params) async {
    try {
      final response = await remoteDataSource.getSurvey();

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
