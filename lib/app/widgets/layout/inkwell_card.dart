import 'package:demo_gallery/all_file/all_file.dart';

class InkWellCard extends StatelessWidget {
  const InkWellCard({Key? key, required this.child, this.onPressed})
      : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
