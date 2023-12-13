import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ristu_intern_challenge/core/env/env_config.dart';
import 'package:ristu_intern_challenge/core/services/dio_handler.dart';
import 'package:ristu_intern_challenge/core/shared/prefs/shared_preferences.dart';
import 'package:ristu_intern_challenge/features/auth/data/datasources/auth_local_datasources.dart';
import 'package:ristu_intern_challenge/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:ristu_intern_challenge/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ristu_intern_challenge/features/auth/domain/repositories/auth_repository.dart';
import 'package:ristu_intern_challenge/features/auth/domain/usecases/login_usecase.dart';
import 'package:ristu_intern_challenge/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ristu_intern_challenge/features/survey/data/datasources/survey_local_datasources.dart';
import 'package:ristu_intern_challenge/features/survey/data/datasources/survey_remote_datasources.dart';
import 'package:ristu_intern_challenge/features/survey/data/repositories/survey_repostitory_impl.dart';
import 'package:ristu_intern_challenge/features/survey/domain/repositories/survey_repository.dart';
import 'package:ristu_intern_challenge/features/survey/domain/usecases/survey_usecase.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/cubit/survey_cubit.dart';

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
        ),
      )

      //AUTH
      ..registerLazySingleton<AuthRemoteDatasource>(
        () => AuthRemoteDatasourceImpl(sl(), sl()),
      )
      ..registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(sl()),
      )
      ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
          sl(),
          sl(),
        ),
      )
      ..registerLazySingleton(() => LoginUsecase(sl()))
      ..registerFactory(
        () => AuthCubit(sl()),
      )

      //SURVEY
      ..registerLazySingleton<SurveyRemoteDatasource>(
        () => SurveyRemoteDatasourceImpl(sl(), sl()),
      )
      ..registerLazySingleton<SurveyLocalDataSource>(
        () => SurveyLocalDataSourceImpl(sl()),
      )
      ..registerLazySingleton<SurveyRepository>(
        () => SurveyRepositoryImpl(
          sl(),
        ),
      )
      ..registerLazySingleton(() => SurveyUsecase(sl()))
      ..registerFactory(
        () => SurveyCubit(sl()),
      );
  }
}
