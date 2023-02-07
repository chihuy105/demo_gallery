import 'package:demo_gallery/all_file/all_file.dart';

class AppBarDividerTopRadius extends StatelessWidget {
  const AppBarDividerTopRadius({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Dimens.rad_circular_XL2),
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Dimens.rad_circular_XL2,
            topRight: Dimens.rad_circular_XL2,
          ),
        ),
        child: child,
      ),
    );
  }
}
