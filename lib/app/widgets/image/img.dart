import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/widgets/image/photoview_utils.dart';

class Img extends StatelessWidget {
  const Img(
    this.src, {
    super.key,
    this.tag,
    this.fit = BoxFit.fitWidth,
    this.canZoom = false,
    this.progressIndicatorBuilder,
    this.errorUrlWidget,
  });

  final String? src;
  final String? tag;
  final BoxFit fit;
  final bool canZoom;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final Widget Function(BuildContext context, Object object, dynamic error)? errorUrlWidget;

  @override
  Widget build(BuildContext context) {
    const errorWidget = AppSkeleton();

    if (src == null) {
      return errorWidget;
    }

    if (src.isNullOrEmpty()) {
      return errorWidget;
    }
    final imageWidget = Hero(
      tag: tag ?? src ?? '',
      child: CachedNetworkImage(
        imageUrl: src!,
        fit: fit,
        progressIndicatorBuilder: progressIndicatorBuilder ??
                (context, url, downloadProgress) => const AppSkeleton(),
        errorWidget: errorUrlWidget ?? (context, url, error) => errorWidget,
      ),
    );

    if (canZoom) {
      return GestureDetector(
        child: imageWidget,
        onTap: () => PhotoviewUtils.onZoomImage(
          context,
          src,
          tag: tag,
        ),
      );
    }

    return imageWidget;
  }
}
