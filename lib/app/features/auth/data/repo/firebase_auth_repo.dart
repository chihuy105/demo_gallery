import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/data/repo/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class FireBaseAuthRepo {

  /// {@macro authentication_repository}
  FireBaseAuthRepo({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  static const int OTP_DURATION_SEC = 80;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserModel? getCurrentUser() {
    if (_firebaseAuth.currentUser == null) {
      return null;
    }
    return UserModel(
       userId: _firebaseAuth.currentUser?.uid,
    );
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<LoginSocialResult?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final accessToken = googleAuth?.accessToken;
      final idToken = googleAuth?.idToken;
      if (accessToken == null || idToken == null) {
        return Future.error(LogInWithSocialCancel());
      }

      late final firebase_auth.AuthCredential credential;
      credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(credential);

      return LoginSocialResult(
        uid: userCredential.user?.uid,
        socialId: googleUser?.id,
        token: googleAuth?.accessToken,
        displayName: googleUser?.displayName,
        email: googleUser?.email,
        photoUrl: googleUser?.photoUrl,
      );
    } on FirebaseAuthException catch (error) {
      logger.e(error);
      return Future.error(LogInWithSocialFailure.fromCode(error.code));
    } catch (error) {
      logger.e(error);
      return Future.error(error);
    }
  }

  /// Signs out the current user which will emit
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }

}


class LoginSocialResult {
  String? token;
  String? email;
  String? displayName;
  String? socialId;
  String? uid;
  String? photoUrl;

//<editor-fold desc="Data Methods">

  LoginSocialResult({
    this.token,
    this.email,
    this.displayName,
    this.socialId,
    this.uid,
    this.photoUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginSocialResult && runtimeType == other.runtimeType && token == other.token && email == other.email && displayName == other.displayName && socialId == other.socialId && uid == other.uid && photoUrl == other.photoUrl);

  @override
  int get hashCode => token.hashCode ^ email.hashCode ^ displayName.hashCode ^ socialId.hashCode ^ uid.hashCode ^ photoUrl.hashCode;

  @override
  String toString() {
    return 'LoginSocialResult{' + ' token: $token,' + ' email: $email,' + ' displayName: $displayName,' + ' socialId: $socialId,' + ' uid: $uid,' + ' photoUrl: $photoUrl,' + '}';
  }

  LoginSocialResult copyWith({
    String? token,
    String? email,
    String? displayName,
    String? socialId,
    String? uid,
    String? photoUrl,
  }) {
    return LoginSocialResult(
      token: token ?? this.token,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      socialId: socialId ?? this.socialId,
      uid: uid ?? this.uid,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': this.token,
      'email': this.email,
      'displayName': this.displayName,
      'socialId': this.socialId,
      'uid': this.uid,
      'photoUrl': this.photoUrl,
    };
  }

  factory LoginSocialResult.fromMap(Map<String, dynamic> map) {
    return LoginSocialResult(
      token: map['token'] as String,
      email: map['email'] as String,
      displayName: map['displayName'] as String,
      socialId: map['socialId'] as String,
      uid: map['uid'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

//</editor-fold>
}