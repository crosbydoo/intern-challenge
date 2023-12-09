import 'package:ristu_intern_challenge/core/env/env_config.dart';

class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      flavorName: 'development',
      apiBaseUrl: '----',
    );
  }

  FlavorSettings.staging() {
    EnvConfig.getInstance(
      flavorName: 'staging',
      apiBaseUrl: '--',
    );
  }

  FlavorSettings.production() {
    EnvConfig.getInstance(
      flavorName: 'production',
      apiBaseUrl: '--',
    );
  }
}
