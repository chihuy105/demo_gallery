import 'package:demo_gallery/all_file/all_file.dart';

class BtnCloseMinusCircle extends StatelessWidget {
  const BtnCloseMinusCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BtnCircleIcon(
      Icons.remove,
      size: Dimens.ic_L,
      iconSize: Dimens.ic_S,
      backgroundColor: const Color(0x99232323),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );
  }
}
