part of 'survey_cubit.dart';

abstract class SurveyState extends Equatable {
  const SurveyState();

  @override
  List<Object> get props => [];
}

class SurveyInitial extends SurveyState {}

class SurveyLoading extends SurveyState {}

class SurveyFailure extends SurveyState {
  const SurveyFailure(this.message);

  final String message;
}

final class GetSurveySuccess extends SurveyState {
  const GetSurveySuccess(this.result);

  final SurveyEntity result;
}

final class GetDetailSurveySuccess extends SurveyState {
  const GetDetailSurveySuccess(this.result);

  final DetailSurveyEntity result;
}
