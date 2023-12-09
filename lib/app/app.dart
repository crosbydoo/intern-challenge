import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristu_intern_challenge/core/router/navigation.dart';
import 'package:ristu_intern_challenge/core/router/routes.dart';
import 'package:ristu_intern_challenge/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final navRoute = Navroute();

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
      initialRoute: Routes.survey,
    );
  }
}
