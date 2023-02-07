import 'package:demo_gallery/all_file/all_file.dart';

class BtnClear extends StatelessWidget {
  const BtnClear({
    super.key,
    required this.onPressed,
    this.padding,
  });

  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? Dimens.edge_x_XS2,
      child: BtnCircleIcon(
        Icons.clear,
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        iconColor: context.theme.hintColor,
      ),
    );
  }
}
