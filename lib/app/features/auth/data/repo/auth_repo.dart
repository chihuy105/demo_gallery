import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/data/repo/firebase_auth_repo.dart';

class AuthRepo {
  AuthRepo({FireBaseAuthRepo? fireBaseAuthRepo}) {
    _fireBaseAuthRepo = fireBaseAuthRepo ?? getIt();
  }

  late final FireBaseAuthRepo _fireBaseAuthRepo;

  UserModel? getCurrentUser() {
    return _fireBaseAuthRepo.getCurrentUser();
  }

  Future<UserModel> signInWithGG() async {
    try {
      try {
        final rs = await _fireBaseAuthRepo.signInWithGoogle();
        logger.i('LoginSocialResult: $rs');

        if (rs?.socialId.isNullOrEmpty() ?? false) {
          return Future.error('SoialId not found');
        }

        return UserModel(
          userId: rs?.uid,
        );
      } catch (e) {
        return Future.error(e);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> logout() async {
    try {
      await _fireBaseAuthRepo.logOut();
    } catch (e) {
      logger.e(e);
    }
    return;
  }
}

