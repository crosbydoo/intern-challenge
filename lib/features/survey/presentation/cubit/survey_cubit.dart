import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ristu_intern_challenge/core/usecase/use_case.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/survey_entity.dart';
import 'package:ristu_intern_challenge/features/survey/domain/usecases/survey_usecase.dart';

part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit(
    this.surveyUsecase,
  ) : super(SurveyInitial());

  final SurveyUsecase surveyUsecase;

  Future<void> getSurvey() async {
    emit(SurveyLoading());

    final result = await surveyUsecase.call(NoParams());
    print('check failure or succ $result');
    // await Future<void>.delayed(const Duration(seconds: 3));

    result.fold(
      (error) => emit(SurveyFailure(error.message)),
      (data) => emit(GetSurveySuccess(data)),
    );
  }
}
