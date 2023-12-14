import 'package:dartz/dartz.dart';
import 'package:ristu_intern_challenge/core/shared/error/failures.dart';
import 'package:ristu_intern_challenge/core/usecase/use_case.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/detail_survey_entity.dart';
import 'package:ristu_intern_challenge/features/survey/domain/repositories/survey_repository.dart';

class QuestionUsecase extends UseCase<DetailSurveyEntity, String> {
  QuestionUsecase(this.repository);

  final SurveyRepository repository;

  @override
  Future<Either<Failure, DetailSurveyEntity>> call(String id) {
    return repository.getQuestion(id);
  }
}
