import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });
  final int code;
  final bool status;
  final String message;
  final dynamic data;

  @override
  List<Object?> get props => [code, status, message, data];
}

class LoginData extends Equatable {
  const LoginData({
    required this.userId,
    required this.nik,
    required this.systemRoleId,
    required this.systemRole,
    required this.name,
    required this.email,
    required this.phone,
    required this.departementId,
    required this.departement,
    required this.siteLocationId,
    required this.siteLocation,
  });
  final String userId;
  final String nik;
  final int systemRoleId;
  final String systemRole;
  final String name;
  final String email;
  final String phone;
  final String departementId;
  final String departement;
  final String siteLocationId;
  final String siteLocation;

  @override
  List<Object?> get props => [
        userId,
        nik,
        systemRole,
        systemRole,
        name,
        email,
        phone,
        departementId,
        departement,
        siteLocationId,
        siteLocation,
      ];
}
