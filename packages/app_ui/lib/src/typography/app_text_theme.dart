
import 'package:app_ui/src/colors/app_colors_extension.dart';
import 'package:app_ui/src/layout/dimens.dart';
import 'package:app_ui/src/typography/font_weights.dart';
import 'package:flutter/material.dart';

extension AppThemeTextContextExtend on BuildContext {
  AppTextThemeExtension get themeText =>
      Theme.of(this).extension<AppTextThemeExtension>() ??
      AppTextThemeExtension.light;
}

@immutable
class AppTextThemeExtension extends ThemeExtension<AppTextThemeExtension> {
  const AppTextThemeExtension({
    required this.text,
    required this.textHint,
    required this.textHeadline,
  });

  static TextStyle defaultText = TextStyle(
    color: AppColorExtension.light.text,
    fontSize: Dimens.text,
  );

  static AppTextThemeExtension dark = AppTextThemeExtension(
    text: defaultText,
    textHint: defaultText.copyWith(
      color: Colors.grey,
    ),
    textHeadline: defaultText.copyWith(
      fontSize: Dimens.text_XL3,
      fontStyle: FontStyle.normal,
      fontWeight: BaseFontWeight.bold,
    ),
  );

  static final AppTextThemeExtension light = AppTextThemeExtension(
    text: defaultText,
    textHint: defaultText.copyWith(
      color: Colors.grey,
    ),
    textHeadline: defaultText.copyWith(
      fontSize: Dimens.text_XL3,
      fontStyle: FontStyle.normal,
      fontWeight: BaseFontWeight.bold,
    ),
  );

  final TextStyle text;
  final TextStyle textHint;
  final TextStyle textHeadline;

  @override
  AppTextThemeExtension copyWith({TextStyle? textStyle, TextStyle? danger}) {
    return AppTextThemeExtension(
      text: textStyle ?? text,
      textHint: textStyle ?? textHint,
      textHeadline: textStyle ?? textHeadline,
    );
  }

  @override
  AppTextThemeExtension lerp(
      ThemeExtension<AppTextThemeExtension>? other, double t) {
    if (other is! AppTextThemeExtension) {
      return this;
    }
    return AppTextThemeExtension(
      text: TextStyle.lerp(text, other.text, t) ?? text,
      textHint: TextStyle.lerp(textHint, other.textHint, t) ?? textHint,
      textHeadline:
          TextStyle.lerp(textHeadline, other.textHeadline, t) ?? textHeadline,
    );
  }

  factory AppTextThemeExtension.of(BuildContext context) {
    return Theme.of(context).extension as AppTextThemeExtension;
  }

  factory AppTextThemeExtension.form(bool isDark) {
    return isDark ? AppTextThemeExtension.dark : AppTextThemeExtension.light;
  }

  static TextTheme getTextTheme({bool isDark = false}) {
    final body = AppTextThemeExtension.form(isDark).text;
    final headline = AppTextThemeExtension.form(isDark).textHeadline;
    return TextTheme(
      bodyText2: body,
      bodyText1: body,
      headline1: headline.copyWith(
        fontSize: 42,
        letterSpacing: -1.5,
        fontWeight: BaseFontWeight.medium,
        color: headline.color,
      ),
      headline2: headline.copyWith(
        fontSize: 34,
        letterSpacing: -0.5,
        fontWeight: BaseFontWeight.medium,
      ),
      headline3: headline.copyWith(
        fontSize: 30,
        letterSpacing: 0,
      ),
      headline4: headline.copyWith(
        fontSize: 26,
        letterSpacing: 0.25,
      ),
      headline5: headline.copyWith(
        fontSize: 22,
        letterSpacing: 0,
        fontWeight: BaseFontWeight.bold,
      ),
      headline6: headline.copyWith(
        fontSize: 20,
        fontWeight: BaseFontWeight.bold,
      ),
      subtitle1: body.copyWith(fontSize: 18, letterSpacing: 0.15),
      subtitle2: body.copyWith(
          fontSize: 16, letterSpacing: 0.1, fontWeight: BaseFontWeight.medium),
      caption: body.copyWith(
        fontSize: 14,
        letterSpacing: 0.4,
      ),
      overline: body.copyWith(fontSize: 14, letterSpacing: 1.5),
      button: body.copyWith(fontWeight: BaseFontWeight.bold),
    );
  }
}
