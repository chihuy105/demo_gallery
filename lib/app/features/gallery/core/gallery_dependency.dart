import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/api/gallery_api.dart';
import 'package:demo_gallery/app/features/gallery/data/repo/gallery_repo.dart';
import 'package:demo_gallery/core/dio/dio_module.dart';

void injectGalleryModule(){
  getIt
    ..registerLazySingleton<GalleryApi>(() => GalleryApi(getIt<DioModule>().dio))
    ..registerLazySingleton<GalleryRepo>(GalleryRepo.new);
}
