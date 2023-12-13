import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:ristu_intern_challenge/core/shared/constant/api_endpoint.dart';
import 'package:ristu_intern_challenge/features/auth/data/datasources/auth_local_datasources.dart';
import 'package:ristu_intern_challenge/features/auth/data/models/request/login_body.dart';
import 'package:ristu_intern_challenge/features/auth/data/models/response/login_model.dart';
import 'package:ristu_intern_challenge/features/auth/domain/entities/login_entity.dart';

abstract class AuthRemoteDatasource {
  Future<LoginEntity> login(LoginBody body);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl(this._client, this._localDataSource);

  final Dio _client;

  final AuthLocalDataSource _localDataSource;
  @override
  Future<LoginEntity> login(LoginBody body) async {
    try {
      final response = await _client.post<Map<String, dynamic>>(
        ApiEndpoint.login,
        data: body.toJson(),
      );

      final headers = response.headers.map;
      final setCookieHeader = headers['set-cookie'];

      String? token;

      if (setCookieHeader != null) {
        for (final cookie in setCookieHeader) {
          final tokenMatch = RegExp('token=([^;]+)').firstMatch(cookie);

          if (tokenMatch != null) {
            token = tokenMatch.group(1);
            break;
          }
        }
      }
      debugPrint('check token $token');

      if (token != null) {
        await _localDataSource.saveBearerToken(token);
      }

      debugPrint('check token $token');

      return LoginModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }
}
