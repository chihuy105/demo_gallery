import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookmarkStorageService {
  Future<void> init() async {
    _box = await Hive.openBox(
      'bookmarkStorage${F.HIVE_STORAGE_VER}',
    );
  }

  late Box<List<String>> _box;

  Future<void> saveUserBookMarkList({
    required String userId,
    required List<PhotoModel> photoList,
  }) async {
    final list = photoList.mapAsList((item) => jsonEncode(item.toJson()));
    await _box.put(userId, list);
  }

  Future<List<PhotoModel>> getUserBookMarkList({
    required String userId,
  }) async {
    final list = _box.get(userId);
    return list.mapAsList((item) => PhotoModel.fromJson(jsonDecode(item) as Map<String, dynamic>));
  }

  Future<void> clear() async {
    await _box.clear();
  }

  void dispose() {
    _box.close();
  }
}
