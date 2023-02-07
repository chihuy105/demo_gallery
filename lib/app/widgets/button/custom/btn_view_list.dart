import 'package:demo_gallery/all_file/all_file.dart';

class BtnViewList extends StatelessWidget {
  const BtnViewList({
    super.key,
    required this.onPressed,
    required this.count,
  });

  final VoidCallback onPressed;
  final num? count;

  @override
  Widget build(BuildContext context) {
    return Btn(
      padding: EdgeInsets.zero,
      btnType: BtnType.TEXT,
      fontWeight: FontWeight.w700,
      label: '${'viewList'} (${count ?? 0})',
      onPressed: onPressed,
    );
  }
}
