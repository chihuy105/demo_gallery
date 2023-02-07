import 'package:demo_gallery/all_file/all_file.dart';

class BtnCircle extends StatelessWidget {
  const BtnCircle({Key? key, required this.child, this.onPressed}) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Btn(
      btnType: BtnType.TEXT,
      child: child,
      onPressed: onPressed,
    );
  }
}

