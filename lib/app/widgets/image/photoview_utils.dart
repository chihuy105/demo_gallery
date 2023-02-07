import 'package:demo_gallery/all_file/all_file.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoviewUtils {
  PhotoviewUtils._();

  static onZoomImage(BuildContext context, String? src) {
    if (src.isNullOrEmpty()) {
      logger.e('Image empty');
      return;
    }
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) {
          return GestureDetector(
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
            child: PhotoView(
              imageProvider: getImageProvider(src),
              backgroundDecoration: const BoxDecoration(color: Colors.black87),
              maxScale: 2.0,
              // enableRotation: true,
              minScale: PhotoViewComputedScale.contained * 0.8,
              initialScale: PhotoViewComputedScale.contained * 0.9,
              heroAttributes: PhotoViewHeroAttributes(tag: src!),
            ),
          );
        },
      ),
    );
  }

  static onZoomLibrary(BuildContext context, List<String> srcList,
      {int? initialPage}) {
    final minScale = PhotoViewComputedScale.contained * 0.8;

    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) {
          return GestureDetector(
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
            child: PhotoViewGallery.builder(
              scrollPhysics: const ClampingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: getImageProvider(srcList.getOrNull(index)),
                  initialScale: minScale,
                  minScale: minScale,
                  heroAttributes:
                      PhotoViewHeroAttributes(tag: srcList.getOrNull(index)!),
                );
              },
              itemCount: srcList.length,
              loadingBuilder: (context, event) => Center(
                child: AppLoading.defaultLoadingBox(height: 20, width: 20),
              ),
              backgroundDecoration: const BoxDecoration(color: Colors.black38),
              pageController: PageController(initialPage: initialPage ?? 0),
              // onPageChanged: onPageChanged,
            ),
          );
        },
      ),
    );
  }

  static onZoomLibraryPage(BuildContext context, List<String> srcList,
      {int? initialPage}) {}

  static ImageProvider getImageProvider(String? src) {
    if (src?.startsWith('http') == true) {
      var url = src!.startsWith('http://')
          ? src.replaceFirst('http://', 'https://')
          : src;

      return NetworkImage(url);
    }
    if (src?.contains('assets/') == true) {
      return AssetImage(src!);
    }
    if ((src?.length ?? 0) > 1 && src?.substring(0, 1) == '/') {
      return FileImage(File(src ?? ''));
    }

    logger.i(src);

    return NetworkImage(src ?? '');
  }
}
