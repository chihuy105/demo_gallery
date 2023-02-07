enum Flavor {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get photoAPIKey => 'd3pY80q0oPq1orCAwRTCYTe5UEy6odjfRuRbRARA1maI40V0m2Clbnd6';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'Demo Gallery Dev';
      case Flavor.STAGING:
        return 'Demo Gallery Stag';
      case Flavor.PRODUCTION:
        return 'Demo Gallery';
      default:
        return 'Demo Gallery';
    }
  }

  static String get SOCKET_URL {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'wss://demo.com';
      case Flavor.STAGING:
        return 'wss://demo.com';
      case Flavor.PRODUCTION:
        return 'wss://demo.com';
      default:
        return 'wss://demo.com';
    }
  }

  static String get SERVER_URL {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'https://api.pexels.com/';
      case Flavor.STAGING:
        return 'https://api.pexels.com/';
      case Flavor.PRODUCTION:
        return 'https://api.pexels.com/';
      default:
        return 'https://api.pexels.com/';
    }
  }

  static String get HIVE_STORAGE_VER {
    return 'HIVE_VER_1';
  }

  static String get DEVICE_TYPE {
    return 'mobile';
  }
}
