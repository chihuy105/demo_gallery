import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/core/auth_dependency.dart';
import 'package:demo_gallery/app/features/gallery/core/gallery_dependency.dart';
import 'package:demo_gallery/core/dio/dio_module.dart';
import 'package:demo_gallery/firebase_options.dart';
import 'package:demo_gallery/firebase_options_dev.dart';
import 'package:demo_gallery/firebase_options_stag.dart';
import 'package:demo_gallery/services/user_secure_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger_and_error/logger/logger_custom.dart';

import 'app/app_routes/app_routes.gr.dart';

final getIt = GetIt.instance;

Future<void> setupAppDependencies() async {
  logger.i('SERVICE starting ...');

  await _appService();
  await _appDataProvider();

  // Navigation
  getIt.registerSingleton<AppAutoRoute>(AppAutoRoute());

  logger.i('SERVICE all started...');
}

Future<void> _appService() async {
  logger = LoggerCustom(logEnable: AppConfig.SHOW_LOG);

  await Hive.initFlutter();
  await Hive.openBox(AppConstant.KEY_BOX_SETTING);

  // Firebase
  switch (F.appFlavor) {
    case Flavor.DEVELOPMENT:
      await Firebase.initializeApp(
        options: DevFirebaseOptions.currentPlatform,
      );
      break;
    case Flavor.STAGING:
      await Firebase.initializeApp(
        options: StagFirebaseOptions.currentPlatform,
      );
      break;
    case Flavor.PRODUCTION:
    case null:
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      break;
  }

  // FlutterError.onError = Crashlytics.instance.recordFlutterError;
  // Call crash test
  // FirebaseCrashlytics.instance.crash();
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    await FirebaseCrashlytics.instance.sendUnsentReports();
  }
}

Future<void> _appDataProvider() async {
  getIt.registerSingleton<DioModule>(DioModule());

  final userSecureStorage = UserStorage();
  await userSecureStorage.init();
  getIt.registerSingleton<UserStorage>(userSecureStorage);

  await injectGalleryModule();
  injectAuthModule();
}
