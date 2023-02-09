import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/presentation/bookmark_viewer/bookmark_viewer_page.dart';
import 'package:demo_gallery/app/features/gallery/presentation/gallery_page/gallery_page.dart';

const galleryRoutes = [
  AutoRoute(
    path: 'gallery',
    page: GalleryPage,
  ),
  AutoRoute(
    path: 'bookmark-viewer',
    page: BookmarkViewerPage,
  )
];
