import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ristu_intern_challenge/core/shared/constant/api_endpoint.dart';
import 'package:ristu_intern_challenge/features/survey/data/datasources/survey_local_datasources.dart';
import 'package:ristu_intern_challenge/features/survey/data/models/response/detail_survey_model.dart';
import 'package:ristu_intern_challenge/features/survey/data/models/response/survey_model.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/detail_survey_entity.dart';
import 'package:ristu_intern_challenge/features/survey/domain/entities/survey_entity.dart';

sealed class SurveyRemoteDatasource {
  Future<SurveyEntity> getSurvey();
  Future<DetailSurveyEntity> getQuestion(String id);
}

class SurveyRemoteDatasourceImpl implements SurveyRemoteDatasource {
  SurveyRemoteDatasourceImpl(this._client, this.localDataSource);

  final Dio _client;
  final SurveyLocalDataSource localDataSource;

  @override
  Future<SurveyEntity> getSurvey() async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '${ApiEndpoint.assessments}??page=1&limit=20',
      );

      debugPrint('check response survey $response');

      final msg = response.data!['message'];
      debugPrint('check response messgae $msg');
      await localDataSource.messagesData(msg.toString());

      return SurveyModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }

  @override
  Future<DetailSurveyEntity> getQuestion(String id) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '${ApiEndpoint.questions}/$id',
      );

      return DetailSurveyModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }
}
