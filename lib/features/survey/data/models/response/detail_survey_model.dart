import 'package:json_annotation/json_annotation.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/detail_survey_entity.dart';

part 'detail_survey_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class DetailSurveyModel extends DetailSurveyEntity {
  const DetailSurveyModel({
    required super.code,
    required super.status,
    required super.message,
    required DetailSurveyDataModel super.data,
  });
  factory DetailSurveyModel.fromJson(Map<String, dynamic> json) =>
      _$DetailSurveyModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class DetailSurveyDataModel extends DetailSurveyData {
  const DetailSurveyDataModel({
    required super.id,
    required super.name,
    required List<QuestionModel> super.question,
  });

  factory DetailSurveyDataModel.fromJson(Map<String, dynamic> json) =>
      _$DetailSurveyDataModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class QuestionModel extends Question {
  const QuestionModel({
    required super.questionid,
    required super.section,
    required super.number,
    required super.type,
    required super.questionName,
    required super.scoring,
    required List<QuestionOptionModel> super.options,
  });
  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class QuestionOptionModel extends QuestionOption {
  const QuestionOptionModel({
    required super.optionid,
    required super.optionName,
    required super.points,
    required super.flag,
  });
  factory QuestionOptionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionOptionModelFromJson(json);
}
