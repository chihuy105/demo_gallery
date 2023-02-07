import 'package:demo_gallery/all_file/all_file.dart';

class BorderImgView extends StatelessWidget {
  const BorderImgView(
    this.src, {
    super.key,
    this.fit,
  });

  final dynamic? src;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecor.cardGrayBorder(
        context,
        color: Colors.grey,
        borderRadius: Dimens.rad_border_circular,
        borderWidth: 0.5,
      ),
      child: Img(
        src,
        fit: fit ?? BoxFit.fitWidth,
      ).cornerRadius(Dimens.rad),
    );
  }
}
