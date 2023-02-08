import 'package:demo_gallery/all_file/all_file.dart';

part 'base_app_bar_args.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.title,
    this.centerTitle,
    this.args,
    this.titleArgs,
  });

  final Object? title;
  final bool? centerTitle;
  final BaseAppBarArgs? args;
  final BaseAppBarTitleArgs? titleArgs;

  @override
  Widget build(BuildContext context) {
    Widget? titleFinal;
    if (title != null) {
      if (title is String) {
        titleFinal = BaseAppBarTitleText(
          title: title as String,
          args: titleArgs,
        );
      } else if (title is Widget) {
        titleFinal = title as Widget;
      }
    }
    final bthBack = BtnBack.isShowBtnBack(context) ? const BtnBack() : null;

    return AppBar(
      title: titleFinal,
      centerTitle: centerTitle ?? false,
      elevation: args?.elevation ?? 0.5,
      titleSpacing: args?.titleSpacing ?? 0,
      leading: args?.leading ?? bthBack,
      bottom: args?.bottom,
      backgroundColor:
          args?.backgroundColor ?? context.theme.appBarTheme.backgroundColor,
      actions: args?.actions ?? <Widget>[],
      flexibleSpace: args?.flexibleSpace,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BaseAppBarTitleText extends StatelessWidget {
  const BaseAppBarTitleText({
    super.key,
    required this.title,
    this.args,
  });

  final BaseAppBarTitleArgs? args;
  final String title;

  @override
  Widget build(BuildContext context) {
    return title.textAuto
        .textStyle(context.themeText.textHeadline)
        .minFontSize(Dimens.text_mid_S)
        .maxLines(args?.maxLine ?? 1)
        .align(args?.textAlign ?? TextAlign.start)
        .color(args?.color ?? context.theme.colorScheme.onPrimary)
        .ellipsis
        .make()
        .marginOnly(right: 8);
  }
}
