// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      code: json['code'] as int,
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'],
    );

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) =>
    LoginDataModel(
      userId: json['userId'] as String,
      nik: json['nik'] as String,
      systemRoleId: json['systemRoleId'] as int,
      systemRole: json['systemRole'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      departementId: json['departementId'] as String,
      departement: json['departement'] as String,
      siteLocationId: json['siteLocationId'] as String,
      siteLocation: json['siteLocation'] as String,
    );
