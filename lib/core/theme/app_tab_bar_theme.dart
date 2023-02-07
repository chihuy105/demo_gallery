// import 'package:demo_gallery/all_file/all_file.dart';
// import 'package:tab_indicator_styler/tab_indicator_styler.dart';
//
// class AppTabBarTheme {
//   AppTabBarTheme._();
//
//   static ThemeData getTabLight(BuildContext context, {double? borderRadius, TextStyle? labelStyle}) {
//     var isDark = Get.isDarkMode;
//
//     return context.theme.copyWith(
//       highlightColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       tabBarTheme: TabBarTheme(
//         indicator: RectangularIndicator(
//           topLeftRadius: borderRadius ?? Dimens.rad_max,
//           topRightRadius: borderRadius ?? Dimens.rad_max,
//           bottomLeftRadius: borderRadius ?? Dimens.rad_max,
//           bottomRightRadius: borderRadius ?? Dimens.rad_max,
//           color: context.themeColor.blueBlur,
//         ),
//         labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//         labelColor: context.theme.primaryColor,
//         labelStyle: labelStyle ?? context.themeText.text,
//         unselectedLabelColor: context.themeText.text.color,
//         unselectedLabelStyle: context.themeText.text,
//       ),
//     );
//   }
//
//   static ThemeData getTabPrimary(
//     BuildContext context, {
//     double? borderRadius,
//     TextStyle? labelStyle,
//     TextStyle? unselectedLabelStyle,
//     EdgeInsetsGeometry? labelPadding,
//   }) {
//     return context.theme.copyWith(
//       highlightColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       tabBarTheme: TabBarTheme(
//         indicator: RectangularIndicator(
//           topLeftRadius: borderRadius ?? Dimens.rad_max,
//           topRightRadius: borderRadius ?? Dimens.rad_max,
//           bottomLeftRadius: borderRadius ?? Dimens.rad_max,
//           bottomRightRadius: borderRadius ?? Dimens.rad_max,
//           color: context.themeColor.lightBlue,
//         ),
//         labelPadding: labelPadding ?? const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//         labelColor: context.theme.primaryColor,
//         labelStyle: labelStyle ?? context.themeText.text,
//         unselectedLabelColor: context.themeText.text.color,
//         unselectedLabelStyle: unselectedLabelStyle ?? context.themeText.text,
//       ),
//     );
//   }
//
//   static ThemeData getTabPrimarySquare(
//     BuildContext context, {
//     TextStyle? labelStyle,
//     EdgeInsetsGeometry? labelPadding,
//     TextStyle? unselectedLabelStyle,
//   }) {
//     return getTabPrimary(
//       context,
//       borderRadius: Dimens.rad_XS,
//       labelStyle: labelStyle ?? context.themeText.text.copyWith(fontWeight: FontWeight.w500),
//       labelPadding: labelPadding,
//       unselectedLabelStyle: unselectedLabelStyle,
//     );
//   }
//
//   static ThemeData getTabPrimarySquare2(
//     BuildContext context, {
//     TextStyle? labelStyle,
//     EdgeInsetsGeometry? labelPadding,
//     TextStyle? unselectedLabelStyle,
//   }) {
//     return getTabPrimary(
//       context,
//       borderRadius: Dimens.rad_XS,
//       labelStyle: labelStyle ??
//           context.themeText.text.copyWith(
//             fontWeight: FontWeight.w700,
//             fontSize: Dimens.text_S,
//           ),
//       labelPadding: labelPadding ?? Dimens.edge_zero,
//       unselectedLabelStyle: unselectedLabelStyle ??
//           context.themeText.text.copyWith(
//             fontWeight: FontWeight.w400,
//             fontSize: Dimens.text_S,
//           ),
//     );
//   }
//
//   static ThemeData getTabUnderlineIndicatorBoldText(
//     BuildContext context, {
//     EdgeInsetsGeometry? labelPadding,
//   }) {
//     return AppTabBarTheme.getTabUnderlineIndicator(
//       context,
//       labelStyle: context.themeText.text.copyWith(fontWeight: FontWeight.bold),
//       unselectedLabelStyle: context.themeText.text.copyWith(fontWeight: FontWeight.w500),
//       labelPadding: labelPadding,
//     );
//   }
//
//   static ThemeData getTabUnderlineIndicator(
//     BuildContext context, {
//     TextStyle? labelStyle,
//     TextStyle? unselectedLabelStyle,
//     EdgeInsetsGeometry? labelPadding,
//   }) {
//     return context.theme.copyWith(
//       highlightColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       tabBarTheme: TabBarTheme(
//         indicator: UnderlineTabIndicator(
//           borderSide: BorderSide(
//             width: 3.0,
//             color: context.theme.primaryColor,
//           ),
//           insets: EdgeInsets.symmetric(horizontal: 0.0),
//         ),
//         labelColor: context.theme.primaryColor,
//         labelStyle: labelStyle ?? context.themeText.text,
//         unselectedLabelColor: context.themeText.text.color,
//         unselectedLabelStyle: unselectedLabelStyle ?? context.themeText.text,
//       ),
//     );
//   }
//
//   static ThemeData getTabSecondary(BuildContext context) {
//     var isDark = Get.isDarkMode;
//
//     return context.theme.copyWith(
//       highlightColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       tabBarTheme: TabBarTheme(
//         indicator: RectangularIndicator(
//           topLeftRadius: Dimens.rad_max,
//           topRightRadius: Dimens.rad_max,
//           bottomLeftRadius: Dimens.rad_max,
//           bottomRightRadius: Dimens.rad_max,
//           color: context.theme.primaryColor,
//         ),
//         labelColor: context.theme.onPrimary(),
//         labelStyle: context.themeText.text.copyWith(fontWeight: FontWeight.w700),
//         unselectedLabelColor: context.themeText.textHint.color,
//         unselectedLabelStyle: context.themeText.text.copyWith(
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//     );
//   }
// }
