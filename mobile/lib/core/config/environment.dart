enum AppEnvironment {
  development,
  production,
}

extension AppEnvironmentExtension on AppEnvironment {
  String get name {
    switch (this) {
      case AppEnvironment.development:
        return 'development';
      case AppEnvironment.production:
        return 'production';
    }
  }

  String get displayName {
    switch (this) {
      case AppEnvironment.development:
        return 'Development';
      case AppEnvironment.production:
        return 'Production';
    }
  }
}

AppEnvironment parseAppEnvironment(String environment) {
  switch (environment.toLowerCase()) {
    case 'production':
      return AppEnvironment.production;
    case 'development':
    default:
      return AppEnvironment.development;
  }
}
