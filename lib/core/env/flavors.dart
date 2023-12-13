import 'package:ristu_intern_challenge/core/env/env_config.dart';

class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      flavorName: 'development',
      apiBaseUrl: 'https://dev-api-lms.apps-madhani.com/v1',
    );
  }

  FlavorSettings.staging() {
    EnvConfig.getInstance(
      flavorName: 'staging',
      apiBaseUrl: 'https://dev-api-lms.apps-madhani.com/v1',
    );
  }

  FlavorSettings.production() {
    EnvConfig.getInstance(
      flavorName: 'production',
      apiBaseUrl: 'https://dev-api-lms.apps-madhani.com/v1',
    );
  }
}
