import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/widgets/image/photoview_utils.dart';

class Img extends StatelessWidget {
  const Img(
    this.src, {
    Key? key,
    this.fit = BoxFit.fitWidth,
    this.canZoom = false,
    this.progressIndicatorBuilder,
    this.errorUrlWidget,
    this.canPlayVideo = false,
  }) : super(key: key);

  final dynamic? src;
  final BoxFit fit;
  final bool canZoom;
  final bool canPlayVideo;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final Widget Function(BuildContext context, Object object, dynamic error)?
      errorUrlWidget;

  @override
  Widget build(BuildContext context) {
    const errorWidget = AppSkeleton();

    if (src == null) {
      return errorWidget;
    }

    String? srcStr;
    if (src is String) {
      srcStr = src as String;
    } else {
      logger.e('Src type not handel');
      return errorWidget;
    }

    if (srcStr.isNullOrEmpty()) {
      return errorWidget;
    }
    Widget? imageWidget;

    if (srcStr!.startsWith('http')) {
      var url = srcStr.startsWith('http://')
          ? srcStr.replaceFirst('http://', 'https://')
          : srcStr;

      if (srcStr.endsWith('.svg')) {
        return SvgPicture.network(srcStr, fit: fit);
      }

      imageWidget = CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        progressIndicatorBuilder: progressIndicatorBuilder ??
            (context, url, downloadProgress) => const AppSkeleton(),
        memCacheHeight: 700,
        errorWidget: errorUrlWidget ?? (context, url, error) => errorWidget,
      );

      //! Not caching
      // return Image.network(
      //   url, fit: this.fit, loadingBuilder: (context, url, downloadProgress)=>CircularProgressIndicator(color: context.theme.primaryColor,).centered(),
      //   errorBuilder: (context, url, error) => errorWidget
      // );
    }

    if (srcStr.contains('assets/')) {
      if (srcStr.contains('.svg')) {
        imageWidget = SvgPicture.asset(
          srcStr,
          fit: fit,
        );
      } else {
        imageWidget = Image.asset(
          srcStr,
          fit: fit,
          errorBuilder: errorUrlWidget ?? (context, url, error) => errorWidget,
        );
      }
    } else if (srcStr.startsWith('/')) {
      imageWidget = Image.file(
        File(srcStr),
        fit: fit,
        errorBuilder: errorUrlWidget ?? (context, url, error) => errorWidget,
      );
    }

    if (imageWidget != null) {
      if (canZoom) {
        return GestureDetector(
          child: imageWidget,
          onTap: () => PhotoviewUtils.onZoomImage(context, srcStr),
        );
      }
      return imageWidget;
    }

    return Gaps.empty;
  }
}
