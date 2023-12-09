import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ristu_intern_challenge/core/env/env_config.dart';
import 'package:ristu_intern_challenge/core/services/dio_handler.dart';
import 'package:ristu_intern_challenge/core/shared/prefs/shared_preferences.dart';

final sl = GetIt.instance;

class Injections {
  Future<void> init() async {
    final config = EnvConfig.getInstance();
    final prefs = await SharedPrefs.getInstance();

    sl
      ..registerLazySingleton(() => config)
      ..registerLazySingleton(() => prefs)
      ..registerLazySingleton<Dio>(() => sl<DioHandler>().dio)
      ..registerLazySingleton(
        () => DioHandler(
          config: sl<EnvConfig>(),
          preferences: sl<SharedPrefs>(),
        ), // Menggunakan tipe yang sesuai
      );
  }
}
