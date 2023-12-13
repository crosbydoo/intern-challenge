// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyModel _$SurveyModelFromJson(Map<String, dynamic> json) => SurveyModel(
      code: json['code'] as int,
      status: json['status'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => SurveyDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SurveyDataModel _$SurveyDataModelFromJson(Map<String, dynamic> json) =>
    SurveyDataModel(
      id: json['id'] as String,
      name: json['name'] as String,
      assessmentDate: DateTime.parse(json['assessment_date'] as String),
      description: json['description'] as String,
      type: json['type'] as String,
      roleAssessor: json['role_assessor'] as int?,
      roleAssessorName: json['role_assessor_name'] as String,
      roleParticipant: json['role_participant'] as int,
      roleParticipantName: json['role_participant_name'] as String,
      departementId: json['departement_id'] as String,
      departementName: json['departement_name'] as String,
      siteLocationId: json['site_location_id'] as String,
      siteLocationName: json['site_location_name'] as String,
      image: json['image'] as String,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => ParticipantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      assessors: json['assessors'],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      downloadedAt: json['downloaded_at'],
    );

ParticipantModel _$ParticipantModelFromJson(Map<String, dynamic> json) =>
    ParticipantModel(
      nik: json['nik'] as String,
      name: json['name'] as String,
      departement: json['departement'] as String,
      departementId: json['departement_id'] as String,
      role: json['role'] as String,
      roleId: json['role_id'] as int,
      siteLocation: json['site_location'] as String,
      siteLocationId: json['site_location_id'] as String,
      totalAssessment: json['total_assessment'] as int,
      lastAssessment: DateTime.parse(json['last_assessment'] as String),
      imageProfile: json['image_profile'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
