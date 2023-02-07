import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/api/gallery_api.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';

class GalleryRepo {
  GalleryRepo({GalleryApi? notificationApi}) {
    _api = notificationApi ?? getIt<GalleryApi>();
  }

  late final GalleryApi _api;

  Future<List<PhotoModel>> getPhotoList({
    int? page,
    int? perPage,
  }) async {
    try {
      final resp = await _api.getPhotoList(
        page: page,
        perPage: perPage,
      );
      return resp?.photos ?? [];

    } catch (e) {
      return Future.error(e);
    }
  }
}
