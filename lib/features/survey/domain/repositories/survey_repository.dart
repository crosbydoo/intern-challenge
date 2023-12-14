// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:ristu_intern_challenge/core/shared/error/failures.dart';
import 'package:ristu_intern_challenge/core/usecase/use_case.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/detail_survey_entity.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/survey_entity.dart';

abstract class SurveyRepository {
  Future<Either<Failure, SurveyEntity>> getSurvey(NoParams params);
  Future<Either<Failure, DetailSurveyEntity>> getQuestion(String id);
}
