// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_survey_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailSurveyModel _$DetailSurveyModelFromJson(Map<String, dynamic> json) =>
    DetailSurveyModel(
      code: json['code'] as int,
      status: json['status'] as bool,
      message: json['message'] as String,
      data:
          DetailSurveyDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

DetailSurveyDataModel _$DetailSurveyDataModelFromJson(
        Map<String, dynamic> json) =>
    DetailSurveyDataModel(
      id: json['id'] as String,
      name: json['name'] as String,
      question: (json['question'] as List<dynamic>)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      questionid: json['questionid'] as String,
      section: json['section'] as String,
      number: json['number'] as String,
      type: json['type'] as String,
      questionName: json['question_name'] as String,
      scoring: json['scoring'] as bool,
      options: (json['options'] as List<dynamic>)
          .map((e) => QuestionOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

QuestionOptionModel _$QuestionOptionModelFromJson(Map<String, dynamic> json) =>
    QuestionOptionModel(
      optionid: json['optionid'] as String,
      optionName: json['option_name'] as String,
      points: json['points'] as int,
      flag: json['flag'] as int,
    );
