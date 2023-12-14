import 'package:equatable/equatable.dart';

class FinalDataEntity extends Equatable {
  const FinalDataEntity({
    required this.surveyId,
    required this.answers,
  });
  final String surveyId;
  final List<Answer> answers;

  @override
  List<Object?> get props => [surveyId, answers];
}

class Answer extends Equatable {
  const Answer({
    required this.questionId,
    required this.answer,
  });
  final String questionId;
  final String answer;

  @override
  List<Object?> get props => [questionId, answer];
}
