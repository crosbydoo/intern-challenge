import 'package:json_annotation/json_annotation.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/survey_entity.dart';

part 'survey_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class SurveyModel extends SurveyEntity {
  const SurveyModel({
    required super.code,
    required super.status,
    required super.message,
    required List<SurveyDataModel> super.data,
  });
  factory SurveyModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class SurveyDataModel extends SurveyDataEntity {
  const SurveyDataModel({
    required super.id,
    required super.name,
    required super.assessmentDate,
    required super.description,
    required super.type,
    required super.roleAssessor,
    required super.roleAssessorName,
    required super.roleParticipant,
    required super.roleParticipantName,
    required super.departementId,
    required super.departementName,
    required super.siteLocationId,
    required super.siteLocationName,
    required super.image,
    required List<ParticipantModel>? super.participants,
    required super.assessors,
    required super.createdAt,
    required super.updatedAt,
    required super.downloadedAt,
  });
  factory SurveyDataModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyDataModelFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ParticipantModel extends ParticipantEntity {
  const ParticipantModel({
    required super.nik,
    required super.name,
    required super.departement,
    required super.departementId,
    required super.role,
    required super.roleId,
    required super.siteLocation,
    required super.siteLocationId,
    required super.totalAssessment,
    required super.lastAssessment,
    required super.imageProfile,
    required super.createdAt,
  });

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantModelFromJson(json);
}
