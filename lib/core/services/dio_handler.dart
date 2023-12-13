import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:ristu_intern_challenge/core/env/env_config.dart';
import 'package:ristu_intern_challenge/core/shared/constant/prefs_key.dart';
import 'package:ristu_intern_challenge/core/shared/prefs/shared_preferences.dart';

class DioHandler {
  DioHandler({required this.config, required this.preferences});

  final EnvConfig config;
  final SharedPrefs preferences;

  Dio get dio => _getDio();

  Dio _getDio() {
    final header = <String, dynamic>{
      'Authorization': preferences.isKeyExists(PrefsKey.tokenBearer),
    };

    final options = BaseOptions(
      baseUrl: config.apiBaseUrl ?? '',
      receiveDataWhenStatusError: true,
      headers: header,
      validateStatus: (status) {
        return status! < 500;
      },
    );

    final dio = Dio(options);

    dio.interceptors.addAll(<Interceptor>[
      _loggingInterceptor(),
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    ]);

    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        final storageToken = preferences.getString(PrefsKey.tokenBearer);
        final headers = {
          'Authorization': 'Bearer $storageToken',
          'Accept': 'application/json',
          'Cookie': 'token=$storageToken',
        };

        options.headers.addAll(headers);

        if (options.headers.containsKey('token')) {
          options.headers.remove('token');
          options.headers.addAll(headers);
        }

        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (error, handler) async {
        return handler.next(error); //continue
      },
    );
  }
}
