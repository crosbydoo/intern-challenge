import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristu_intern_challenge/core/di/injections.dart';
import 'package:ristu_intern_challenge/core/router/navigation.dart';
import 'package:ristu_intern_challenge/core/router/routes.dart';
import 'package:ristu_intern_challenge/core/shared/constant/prefs_key.dart';
import 'package:ristu_intern_challenge/core/shared/prefs/shared_preferences.dart';
import 'package:ristu_intern_challenge/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final navRoute = Navroute();

    final prefs = sl<SharedPrefs>();

    final token = prefs.getString(PrefsKey.tokenBearer);
    final isChecked = prefs.getBool(PrefsKey.saveRemember);

    debugPrint('check remember me $isChecked');
    debugPrint('check token di Main $token');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      getPages: navRoute.routes,
      initialRoute: token.isEmpty
          ? Routes.login
          : (isChecked != true)
              ? Routes.login
              : Routes.survey,
    );
  }
}
