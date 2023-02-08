import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/services/user_secure_storage_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Author: Kyo Huu
/// Create date: 7/28/2020
///
/// This module provide a Dio instance to all the Service that's needed it
/// It will also contain the base url and all other Dio option
///

enum ItemDetailStatus { initial, loading, success, error }

class DioModule {
  DioModule();

  Dio? _dio;

  Dio get dio {
    if (_dio != null) {
      return _dio!;
    }

    logger.i('**** Dio create');
    final options = BaseOptions(
      baseUrl: F.SERVER_URL,
      connectTimeout: 11000,
      receiveTimeout: 11000,
      sendTimeout: 11000,
    );
    // Get Data for mobile on server
    options.headers["device"] = F.DEVICE_TYPE;

    _dio = Dio(options);

    if (AppConfig.SHOW_LOG) {
      _dio!.interceptors.add(PrettyDioLogger(
        request: false,
        requestHeader: false,
        requestBody: true,
        responseBody: false,
      ));
    }

    dio.options.headers["Authorization"] = F.photoAPIKey;
    // Check token
    // final storage = getIt<UserSecureStorage>();
    // if (storage.user != null) {
    //   dio.options.headers["Authorization"] = F.photoAPIKey;
    //   addToken(storage.user!.token);
    // }

    addTokenInterceptor();

    return _dio!;
  }

  // TODO Add token to Interceptor
  void addTokenInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
      if (error.response?.statusCode == 401) {
        logger.i('interceptor 401');

        final storage = getIt<UserSecureStorage>();
        storage.notifyUnAuthorized();
      }

      return handler.next(error);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }));
  }

  void addToken(String? token) {
    if (token == null) return;
    logger.i('DioModule.addToken => $token');

    dio.options.headers["Authorization"] = 'Bearer $token';
    dio.options.headers["token"] = token;
  }

  void removeToken() {
    logger.i('DioModule.removeToken =>');
    dio.options.headers["Authorization"] = null;
    dio.options.headers["token"] = null;
  }

  @override
  void onClose() {
    logger.i('**** Dio clear');
    //dio.clear();
  }
}

bool? boolFormAny(dynamic source) {
  if (source == null) {
    return null;
  }
  if (source is bool) {
    return source;
  } else if (source is String) {
    return source == '1';
  } else if (source is int) {
    return source == 1;
  }
  return false;
}
