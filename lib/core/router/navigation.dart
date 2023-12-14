import 'package:get/get.dart';
import 'package:ristu_intern_challenge/core/router/routes.dart';
import 'package:ristu_intern_challenge/features/auth/presentation/screens/login_screen.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/contents/results_content.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/screens/survey_screen.dart';
import 'package:ristu_intern_challenge/features/survey/presentation/screens/survey_todo_screen.dart';

class Navroute {
  List<GetPage<dynamic>> routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.survey,
      page: () => const SurveyScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.surveytodo,
      page: () => const SurveyTodoScreen(uuid: ''),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.results,
      page: () => const ResultContent(
        finaldata: {},
      ),
      transition: Transition.cupertino,
    ),
  ];
}
