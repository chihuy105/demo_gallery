import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/services/user_secure_storage_service.dart';
import 'package:flutter/services.dart';

class RepoError implements Exception {
  final String errorMsg;

  RepoError(this.errorMsg);
}

extension DioErrorExtend on Object? {
  String? getServerErrorCode() {
    if (this is DioError) {
      var errorCode = castOrNull<String>((this as DioError).response?.data?['errorCode']);
      return errorCode;
    }
    return null;
  }

  T? getErrorCodeDataValue<T>(String key) {
    if (this is DioError) {
      return castOrNull<T>((this as DioError).response?.data?[key]);
    }
    return null;
  }

  String getServerErrorMsg() {
    final object = this;
    if (object is RepoError) {
      return object.errorMsg;
    }
    if (object is DioError) {
      final dioError = object;
      if (dioError.response?.statusCode == 401) {
        return 'pleaseLogin';
      }
      if (dioError.error.toString().contains('Failed host lookup')) {
        return 'reconnectMsg';
      }
      final errorCode = dioError.response?.data['errorCode'] as String?;
      if (errorCode != null) {
        return errorCode;
      }
    }
    if (kDebugMode || AppConfig.IN_DEV) {
      if (object is PlatformException) {
        return '${(object as PlatformException).message} \n\n\n---\n\n\n ${(object as PlatformException).stacktrace} \n\n\n---\n\n\n $object';
      }
      return '$object';
    }
    return 'errorPleaseRetry';
  }
}
