import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ristu_intern_challenge/core/usecase/use_case.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/detail_survey_entity.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/survey_entity.dart';
import 'package:ristu_intern_challenge/features/survey/domain/usecases/question_usecase.dart';
import 'package:ristu_intern_challenge/features/survey/domain/usecases/survey_usecase.dart';

part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit(
    this.surveyUsecase,
    this.questionUsecase,
  ) : super(SurveyInitial());

  final SurveyUsecase surveyUsecase;
  final QuestionUsecase questionUsecase;

  Future<void> getSurvey() async {
    emit(SurveyLoading());

    final result = await surveyUsecase.call(NoParams());

    result.fold(
      (error) => emit(SurveyFailure(error.message)),
      (data) => emit(GetSurveySuccess(data)),
    );
  }

  Future<void> getQuestion(String uuid) async {
    emit(SurveyLoading());

    final result = await questionUsecase.call(uuid);

    result.fold(
      (error) => emit(SurveyFailure(error.message)),
      (data) => emit(GetDetailSurveySuccess(data)),
    );
  }
}
