import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/widgets/button/actions/btn_see_all.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.titleLeading,
    this.titlePadding,
    this.onSeeAllPressed,
  });

  final String title;
  final Widget? titleLeading;
  final EdgeInsets? titlePadding;

  final VoidCallback? onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: titlePadding ?? Dimens.edge_default,
      child: Row(
        children: [
          titleLeading?.pr12() ?? Gaps.empty,
          title.text.headline5(context).maxLines(1).make().expand(),
          if (onSeeAllPressed != null)
            BtnSeeAll(
              padding: Dimens.edge_btn_wide_XS.copyWith(right: 0),
              onPressed: onSeeAllPressed,
            ),
        ],
      ),
    );
  }
}
