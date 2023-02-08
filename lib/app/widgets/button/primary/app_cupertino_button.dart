import 'package:demo_gallery/all_file/all_file.dart';
import 'package:flutter/cupertino.dart';

class AppCupertinoBtn extends StatelessWidget {
  const AppCupertinoBtn({
    super.key,
    this.child,
    this.onPressed,
    this.padding,
  });

  final Widget? child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: padding,
      minSize: 0,
      child: child ?? Gaps.empty,
    );
  }
}
