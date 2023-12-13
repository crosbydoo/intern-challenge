import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
class LoginBody {
  LoginBody({
    required this.nik,
    required this.password,
  });
  String nik;
  String password;

  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);
}
