import 'package:json_annotation/json_annotation.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/final_data_entity.dart';

part 'final_data_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class FinalDataModel extends FinalDataEntity {
  const FinalDataModel({
    required super.surveyId,
    required List<AnswerModel> super.answers,
  });
  factory FinalDataModel.fromJson(Map<String, dynamic> json) =>
      _$FinalDataModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class AnswerModel extends Answer {
  const AnswerModel({required super.questionId, required super.answer});
  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}
