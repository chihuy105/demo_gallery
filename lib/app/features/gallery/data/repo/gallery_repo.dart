import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/datasource/bookmark_storage_service.dart';
import 'package:demo_gallery/app/features/gallery/data/datasource/gallery_api.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';

class GalleryRepo {
  GalleryRepo({GalleryApi? notificationApi, BookmarkStorageService? bookmarkStorageService}) {
    _api = notificationApi ?? getIt();
    _bookmarkStorageService = bookmarkStorageService ?? getIt();
  }

  late final GalleryApi _api;
  late final BookmarkStorageService _bookmarkStorageService;

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

  Future<List<PhotoModel>> getUserBookmarkList({
    required String userId,
  }) async {
    try {
      return _bookmarkStorageService.getUserBookMarkList(userId: userId);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> clearUserBookMarkList({
    required String userId,
  }) async {
    try {
      return _bookmarkStorageService.saveUserBookMarkList(userId: userId, photoList: []);
    } catch (e) {
      return Future.error(e);
    }
  }
}
