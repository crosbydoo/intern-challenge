class EnvConfig {
  EnvConfig({
    this.flavorName,
    this.apiBaseUrl,
    this.apiSentry,
  });

  factory EnvConfig.getInstance({
    String? flavorName,
    String? apiBaseUrl,
    String? apiSentry,
  }) {
    if (_instance == null) {
      _instance = EnvConfig(
        flavorName: flavorName,
        apiBaseUrl: apiBaseUrl,
        apiSentry: apiSentry,
      );
      return _instance!;
    }
    return _instance!;
  }

  final String? flavorName;
  final String? apiBaseUrl;
  final String? apiSentry;

  // Digunakan untuk melacak apakan hanya ada 1 instance dalam aplikasi
  static EnvConfig? _instance;
}
