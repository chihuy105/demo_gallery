import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/datasource/gallery_api.dart';
import 'package:demo_gallery/app/features/gallery/data/datasource/bookmark_storage_service.dart';
import 'package:demo_gallery/app/features/gallery/data/repo/gallery_repo.dart';

Future<void> injectGalleryModule() async {
  final bookmarkStorageService = BookmarkStorageService();
  final init = await bookmarkStorageService.init();
  getIt
    ..registerSingleton<BookmarkStorageService>(bookmarkStorageService)
    ..registerLazySingleton<GalleryApi>(() => GalleryApi(getIt<DioModule>().dio))
    ..registerLazySingleton<GalleryRepo>(GalleryRepo.new);
}
