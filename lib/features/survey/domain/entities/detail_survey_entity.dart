import 'package:equatable/equatable.dart';

class DetailSurveyEntity extends Equatable {
  const DetailSurveyEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  final int code;
  final bool status;
  final String message;
  final DetailSurveyData data;

  @override
  List<Object?> get props => [code, status, message, data];
}

class DetailSurveyData extends Equatable {
  const DetailSurveyData({
    required this.id,
    required this.name,
    required this.question,
  });
  final String id;
  final String name;
  final List<Question> question;

  @override
  List<Object?> get props => [id, name, question];
}

class Question extends Equatable {
  const Question({
    required this.questionid,
    required this.section,
    required this.number,
    required this.type,
    required this.questionName,
    required this.scoring,
    required this.options,
  });
  final String questionid;
  final String section;
  final String number;
  final String type;
  final String questionName;
  final bool scoring;
  final List<QuestionOption> options;

  @override
  List<Object?> get props => [
        questionid,
        section,
        number,
        type,
        questionName,
        scoring,
        options,
      ];
}

class QuestionOption extends Equatable {
  const QuestionOption({
    required this.optionid,
    required this.optionName,
    required this.points,
    required this.flag,
  });
  final String optionid;
  final String optionName;
  final int points;
  final int flag;

  @override
  List<Object?> get props => [optionid, optionName, points, flag];
}
