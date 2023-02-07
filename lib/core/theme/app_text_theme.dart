// import 'package:demo_gallery/all_file/all_file.dart';
//
// class AppTextTheme {
//   AppTextTheme._();
//
//   static const double DEFAULT_FONT_SIZE = Dimens.text;
//
//   static TextStyle text =
//       TextStyle(color: context.themeText.text.color, fontSize: DEFAULT_FONT_SIZE);
//
//   static TextStyle textLink = text.copyWith(
//     color: context.themeColorText.textLink,
//   );
//
//   static TextStyle textHint = text.copyWith(color: context.themeColorText.textHint);
//
//   static TextStyle textTitle = text.copyWith(
//     color: context.themeColorText.textGray,
//     fontSize: Dimens.text_XL3,
//     fontStyle: FontStyle.normal,
//     fontWeight: FontWeight.w700,
//   );
//
//   static TextTheme getTextTheme({bool isDarkMode = false}) {
//     var textDynamic = text.copyWith(
//         color: isDarkMode ? context.themeText.text.color.dark : context.themeText.text.color.light);
//     return TextTheme(
//       bodyText2: textDynamic,
//       bodyText1: textDynamic,
//       headline1: textDynamic.copyWith(
//           fontSize: 42,
//           letterSpacing: -1.5,
//           fontWeight: FontWeight.w500,
//           color: context.themeColor.textHeading.form(isDarkMode)),
//       headline2: textDynamic.copyWith(
//           fontSize: 34,
//           letterSpacing: -0.5,
//           fontWeight: FontWeight.w500,
//           color: context.themeColor.textHeading.form(isDarkMode)),
//       headline3: textDynamic.copyWith(
//           fontSize: 30,
//           letterSpacing: 0,
//           color: context.themeColor.textHeading.form(isDarkMode)),
//       headline4: textDynamic.copyWith(
//           fontSize: 26,
//           letterSpacing: 0.25,
//           color: context.themeColor.textHeading.form(isDarkMode)),
//       headline5: textDynamic.copyWith(
//           fontSize: 22,
//           letterSpacing: 0,
//           fontWeight: FontWeight.w700,
//           color: context.themeColor.textHeading.form(isDarkMode)),
//       headline6: textDynamic.copyWith(
//           fontSize: 20,
//           fontWeight: FontWeight.w700,
//           color: context.themeColor.textHeading.form(isDarkMode)),
//       subtitle1: textDynamic.copyWith(fontSize: 18, letterSpacing: 0.15),
//       subtitle2: textDynamic.copyWith(
//           fontSize: 16, letterSpacing: 0.1, fontWeight: FontWeight.w500),
//       caption: textDynamic.copyWith(
//           fontSize: 14, letterSpacing: 0.4, color: context.themeColorText.textHint),
//       overline: textDynamic.copyWith(fontSize: 14, letterSpacing: 1.5),
//       button: textDynamic.copyWith(fontWeight: FontWeight.w700),
//     );
//   }
//
//   //! The order of the key is override from top to bottom
//   static Map<String, Style> getHtmlStyle(BuildContext context) {
//     return {
//       ...Style.fromThemeData(context.theme),
//       "body": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
//       "html": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
//       "p": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
//       "strong": Style(textAlign: TextAlign.center),
//       "li": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
//       "li:not(:last-child)": Style(
//         padding: const EdgeInsets.only(bottom: 0, left: 0),
//       ),
//       "ul": Style(
//         listStylePosition: ListStylePosition.OUTSIDE,
//       ),
//       "table": Style(
//         backgroundColor:
//             Theme.of(context).unselectedWidgetColor.withOpacity(0.1),
//         // border: Border.all(color: Theme.of(context).hintColor),
//       ),
//       "tr": Style(
//         border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.3)),
//         // border: Border(bottom: BorderSide(color: Colors.grey)),
//       ),
//       "th": Style(
//         padding: const EdgeInsets.all(6),
//         backgroundColor: Colors.grey,
//       ),
//       "td": Style(
//         padding: const EdgeInsets.all(6),
//       ),
//     };
//   }
//
//   static Map<String, Style> getHtmlDescriptionStyle(BuildContext context) {
//     return {
//       "p": Style(
//           textAlign: TextAlign.justify,
//           maxLines: 2,
//           textOverflow: TextOverflow.ellipsis,
//           fontSize: FontSize.medium),
//     };
//   }
// }
