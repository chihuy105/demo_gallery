import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/core/utils/view_utils.dart';

class ShowMoreText extends StatelessWidget {
  const ShowMoreText({super.key, this.content, this.maxLines, this.textStyle, this.moreBtnBuilder});

  final String? content;
  final TextStyle? textStyle;
  final int? maxLines;
  final Widget Function(bool isMore, VoidCallback onPressed)? moreBtnBuilder;

  @override
  Widget build(BuildContext context) {
    if (content.isNullOrEmpty()) {
      return Gaps.empty;
    }

    final finalMaxLines = maxLines ?? 8;
    final finalTextStyle = textStyle ?? context.textTheme.bodyText2!;
    final more = content!.text.textStyle(finalTextStyle).make();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final maxWidth = constraints.maxWidth;

        final textExceedMaxLines = ViewUtils.isTextExceedMaxLines(
          text: content!,
          style: finalTextStyle,
          maxLine: finalMaxLines,
          maxWidth: maxWidth,
        );
        return textExceedMaxLines
            ? ShowMoreLayout(
                moreLayout: more,
                moreBtnBuilder: moreBtnBuilder,
                lessLayout: content!.text.textStyle(finalTextStyle).maxLines(finalMaxLines).ellipsis.make(),
              )
            : more;
      },
    );
  }
}
