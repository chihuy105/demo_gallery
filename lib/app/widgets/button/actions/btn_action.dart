import 'package:demo_gallery/all_file/all_file.dart';
import 'package:flutter/cupertino.dart';

class BtnAction extends StatelessWidget {
  const BtnAction({
    super.key,
    this.iconColor,
    this.backgroundColor,
    this.onPressed,
    this.child,
  });

  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Btn(
      btnType: BtnType.TEXT,
      onPressed: onPressed,
      child: child,
    );
  }
}
