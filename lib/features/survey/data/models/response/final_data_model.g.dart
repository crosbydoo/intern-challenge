// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'final_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinalDataModel _$FinalDataModelFromJson(Map<String, dynamic> json) =>
    FinalDataModel(
      surveyId: json['survey_id'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
      questionId: json['question_id'] as String,
      answer: json['answer'] as String,
    );
