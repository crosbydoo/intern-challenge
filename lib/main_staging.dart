import 'package:flutter/material.dart';
import 'package:ristu_intern_challenge/app/app.dart';
import 'package:ristu_intern_challenge/bootstrap.dart';
import 'package:ristu_intern_challenge/core/env/flavors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorSettings.production();
  bootstrap(() => const App());
}
