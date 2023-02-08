import 'package:demo_gallery/all_file/all_file.dart';
import 'package:flutter/cupertino.dart';

class BtnBack extends StatelessWidget {

  const BtnBack({
    super.key,
    this.onPress,
    this.size = 25,
    this.iconColor,
    this.backgroundColor,
    this.checkCanPop = true,
    this.isCupertino = true,
  });

  final VoidCallback? onPress;
  final double size;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool? checkCanPop;
  final bool isCupertino;

  static bool isShowBtnBack(BuildContext context) => (ModalRoute.of(context)?.canPop ?? false) == true;

  static BtnBack transparent(BuildContext context) {
    return BtnBack(
      iconColor: Theme.of(context).canvasColor,
      backgroundColor: Colors.transparent,
    );
  }

  static BtnBack forHeader(BuildContext context, bool isTransparent) {
    final iconColor = isTransparent ? Colors.white : Theme.of(context).primaryColor;
    final iconBackground = isTransparent ? Colors.grey[600]!.withOpacity(0.3) : Colors.transparent;

    return BtnBack(
      iconColor: iconColor,
      backgroundColor: iconBackground,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (checkCanPop ?? false) {
      if (!isShowBtnBack(context)) {
        return Gaps.empty;
      }
    }

    if (isCupertino) {
      return Btn(
        btnType: BtnType.TEXT,
        padding: Dimens.edge_S,
        onPressed: onPress ?? () => context.router.pop(),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: size,
          color: context.theme.colorScheme.onPrimary,
        ),
      );
    }

    final iconColorUse = iconColor ?? context.theme.iconTheme.color;
    final backgroundColorUse = backgroundColor ?? Colors.transparent;

    return BtnCircleIcon(
      Icon(
        Icons.arrow_back_ios_new_rounded,
        size: size,
        color: iconColorUse,
      ),
      onPressed: onPress ?? () => context.router.pop(),
      backgroundColor: backgroundColorUse,
      iconColor: iconColorUse,
    );
  }
}
