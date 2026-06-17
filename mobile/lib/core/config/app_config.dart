import 'environment.dart';

class AppConfig {
  final AppEnvironment environment;
  final String appName;
  final String apiBaseUrl;
  final String supabaseUrl;
  final bool enableDebugLogging;

  const AppConfig({
    required this.environment,
    required this.appName,
    required this.apiBaseUrl,
    required this.supabaseUrl,
    required this.enableDebugLogging,
  });

  factory AppConfig.fromEnvironment({
    String environmentName = const String.fromEnvironment('ENV', defaultValue: 'development'),
  }) {
    return AppConfig.forEnvironment(parseAppEnvironment(environmentName));
  }

  factory AppConfig.forEnvironment(AppEnvironment environment) {
    switch (environment) {
      case AppEnvironment.production:
        return const AppConfig(
          environment: AppEnvironment.production,
          appName: 'Tiendita POS',
          apiBaseUrl: 'https://cl-miscelanea-pos-back-0t5q.onrender.com',
          supabaseUrl: 'https://supabase.tiendita.com',
          enableDebugLogging: false,
        );
      case AppEnvironment.development:
        return const AppConfig(
          environment: AppEnvironment.development,
          appName: 'Tiendita POS (Dev)',
          apiBaseUrl: 'https://cl-miscelanea-pos-back-0t5q.onrender.com',
          supabaseUrl: 'https://dev-supabase.tiendita.com',
          enableDebugLogging: true,
        );
    }
  }

  String get environmentLabel => environment.displayName;
}
