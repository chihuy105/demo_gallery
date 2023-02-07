import 'package:demo_gallery/all_file/all_file.dart';

enum BtnCircleIconType { normal, gray, primary }

class BtnCircleIcon extends StatelessWidget {
  const BtnCircleIcon(
    this.icon, {
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
    this.borderColor,
    this.borderSize = 2,
    this.size = Dimens.ic_XL2,
    this.type = BtnCircleIconType.normal,
    this.padding,
    Key? key,
    this.showShadow,
  }) : super(key: key);

  final BtnCircleIconType type;
  final dynamic icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? iconSize;
  final Color? iconColor;
  final Color? borderColor;
  final double? size;
  final double borderSize;
  final EdgeInsetsGeometry? padding;
  final bool? showShadow;

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Gaps.empty;
    Color finalIconColor = Colors.white;
    Color finalBackgroundColor = Colors.grey[600]!.withOpacity(0.3);

    if (type == BtnCircleIconType.gray) {
      finalIconColor = context.textTheme.bodyMedium!.color!;
      finalBackgroundColor = context.theme.hintColor.withOpacity(0.5);
    }
    if (type == BtnCircleIconType.primary) {
      finalIconColor = context.theme.primaryColor;
      finalBackgroundColor = context.theme.colorScheme.onPrimary;
    }
    if (iconColor != null) {
      finalIconColor = iconColor!;
    }

    if (iconColor != null) {
      finalIconColor = iconColor!;
    }
    if (backgroundColor != null) {
      finalBackgroundColor = backgroundColor!;
    }

    if (icon is IconData) {
      iconWidget = FittedBox(
        child: Icon(
          castOrNull(icon),
          size: iconSize ?? Dimens.ic_L,
          color: finalIconColor,
        ),
      );
    } else if (icon is Widget) {
      iconWidget = icon as Widget;
    }

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: finalBackgroundColor,
        shape: BoxShape.circle,
        boxShadow: showShadow == true
            ? [
                const BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 1.0,
                ),
              ]
            : null,
      ),
      child: Btn(
        padding: padding ?? Dimens.edge_zero,
        btnType: BtnType.TEXT,
        onPressed: onPressed ?? () {},
        child: iconWidget,
      ),
    );
  }
}
