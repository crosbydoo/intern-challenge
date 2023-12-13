import 'package:dartz/dartz.dart';
import 'package:ristu_intern_challenge/core/shared/error/failures.dart';
import 'package:ristu_intern_challenge/core/usecase/use_case.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/survey_entity.dart';
import 'package:ristu_intern_challenge/features/survey/domain/repositories/survey_repository.dart';

class SurveyUsecase extends UseCase<SurveyEntity, NoParams> {
  SurveyUsecase(this.repository);

  final SurveyRepository repository;

  @override
  Future<Either<Failure, SurveyEntity>> call(NoParams params) {
    return repository.getSurvey(params);
  }
}
