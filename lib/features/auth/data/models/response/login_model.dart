import 'package:json_annotation/json_annotation.dart';
import 'package:ristu_intern_challenge/features/auth/domain/entities/login_entity.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginModel extends LoginEntity {
  const LoginModel({
    required super.code,
    required super.status,
    required super.message,
    required super.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class LoginDataModel extends LoginData {
  const LoginDataModel({
    required super.userId,
    required super.nik,
    required super.systemRoleId,
    required super.systemRole,
    required super.name,
    required super.email,
    required super.phone,
    required super.departementId,
    required super.departement,
    required super.siteLocationId,
    required super.siteLocation,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);
}
