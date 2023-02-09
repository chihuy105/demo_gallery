import 'package:demo_gallery/all_file/all_file.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserStorage {
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) {
      return;
    }
    _box = await Hive.openBox(
      'secureStorage${F.HIVE_STORAGE_VER}',
    );
    _isInitialized = true;
  }

  void dispose() {
    userLD.close();
  }

  late Box _box;

  final Rx<UserModel?> userLD = Rx<UserModel?>(null);

  String? get userId => user?.userId;

  bool get isLogin => user != null;

  Future<void> clear() async {
    userLD.value = null;
  }

  Future<void> setUserModel(UserModel user) async {
    logger.i('setUserModel $user');
    userLD.value = user;
  }

  UserModel? get user {
    return userLD.value;
  }

}
