import 'package:demo_gallery/all_file/all_file.dart';
import 'package:flutter/cupertino.dart';

class AppLoading {
  AppLoading._();

  static Widget defaultLoading({
    bool isLoading = true,
    bool center = true,
    double? strokeWidth,
    Color? color,
  }) {
    var loading = isLoading
        ? CupertinoActivityIndicator(
            color: color,
          )
        : Gaps.empty;

    return center ? loading.centered() : loading;
  }

  static Widget defaultLoadingCenter({
    bool isLoading = true,
    double? strokeWidth,
    Color? color,
  }) {
    return defaultLoading(
      strokeWidth: strokeWidth,
      color: color,
      isLoading: isLoading,
      center: true,
    );
  }

  static Widget materialLoading({
    bool isLoading = true,
    bool center = true,
    double? strokeWidth,
    Color? color,
  }) {
    var loading =
        isLoading ? CircularProgressIndicator(color: color) : Gaps.empty;

    return center ? loading.centered() : loading;
  }

  static Widget defaultLoadingBox(
      {bool isLoading = true,
      double? strokeWidth,
      Color? color,
      double size = 40,
      double? height,
      double? width,
      bool center = true}) {
    if (!isLoading) return Gaps.empty;

    return SizedBox(
        height: height ?? size,
        width: width ?? size,
        child: AppLoading.defaultLoading(
          isLoading: isLoading,
          strokeWidth: strokeWidth,
          color: color,
          center: center,
        ));
  }

  static Widget materialLoadingBox(BuildContext context,
      {bool isLoading = true,
      double? strokeWidth,
      Color? color,
      double size = 40,
      double? height,
      double? width,
      bool center = true}) {
    if (!isLoading) return Gaps.empty;

    return SizedBox(
        height: height ?? size,
        width: width ?? size,
        child: AppLoading.materialLoading(
          isLoading: isLoading,
          strokeWidth: strokeWidth,
          color: color ?? context.theme.colorScheme.onPrimary,
          center: center,
        ));
  }
}
