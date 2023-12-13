import 'package:equatable/equatable.dart';

class SurveyEntity extends Equatable {
  const SurveyEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  final int code;
  final bool status;
  final String message;
  final List<SurveyDataEntity> data;

  @override
  List<Object?> get props => [code, status, message, data];
}

class SurveyDataEntity extends Equatable {
  const SurveyDataEntity({
    required this.id,
    required this.name,
    required this.assessmentDate,
    required this.description,
    required this.type,
    required this.roleAssessor,
    required this.roleAssessorName,
    required this.roleParticipant,
    required this.roleParticipantName,
    required this.departementId,
    required this.departementName,
    required this.siteLocationId,
    required this.siteLocationName,
    required this.image,
    required this.participants,
    required this.assessors,
    required this.createdAt,
    required this.updatedAt,
    required this.downloadedAt,
  });
  final String id;
  final String name;
  final DateTime assessmentDate;
  final String description;
  final String type;
  final int? roleAssessor;
  final String roleAssessorName;
  final int roleParticipant;
  final String roleParticipantName;
  final String departementId;
  final String departementName;
  final String siteLocationId;
  final String siteLocationName;
  final String image;
  final List<ParticipantEntity>? participants;
  final dynamic assessors;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic downloadedAt;

  @override
  List<Object?> get props => [
        id,
        name,
        assessmentDate,
        description,
        type,
        roleAssessor,
        roleAssessorName,
        roleParticipant,
        roleAssessorName,
        departementId,
        departementName,
        siteLocationId,
        siteLocationName,
        image,
        participants,
        assessors,
        createdAt,
        updatedAt,
        downloadedAt,
      ];
}

class ParticipantEntity extends Equatable {
  const ParticipantEntity({
    required this.nik,
    required this.name,
    required this.departement,
    required this.departementId,
    required this.role,
    required this.roleId,
    required this.siteLocation,
    required this.siteLocationId,
    required this.totalAssessment,
    required this.lastAssessment,
    required this.imageProfile,
    required this.createdAt,
  });
  final String nik;
  final String name;
  final String departement;
  final String departementId;
  final String role;
  final int roleId;
  final String siteLocation;
  final String siteLocationId;
  final int totalAssessment;
  final DateTime lastAssessment;
  final String imageProfile;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
        nik,
        name,
        departement,
        departementId,
        role,
        roleId,
        siteLocation,
        siteLocationId,
        totalAssessment,
        lastAssessment,
        imageProfile,
        createdAt,
      ];
}
