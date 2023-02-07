part of 'auth_bloc.dart';

class AuthData {

  const AuthData({
    this.userModel,
  });

  final UserModel? userModel;

//<editor-fold desc="Data Methods">

  factory AuthData.fromMap(Map<String, dynamic> map) {
    return AuthData(
      userModel: map['userModel'] as UserModel,
    );
  }

  AuthData updateUser({
    UserModel? userModel,
  }) {
    return AuthData(
      userModel: userModel,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || (other is AuthData && runtimeType == other.runtimeType && userModel == other.userModel);

  @override
  int get hashCode => userModel.hashCode;

  @override
  String toString() {
    return 'AuthData{' + ' userModel: $userModel,' + '}';
  }

  AuthData copyWith({
    UserModel? userModel,
  }) {
    return AuthData(
      userModel: userModel ?? this.userModel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userModel': this.userModel,
    };
  }

//</editor-fold>
}

@immutable
abstract class AuthState {
  const AuthState(this.data);

  final AuthData data;
}

class AuthInitialState extends AuthState {
  const AuthInitialState(super.data);
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState(super.data);
}

class UnAuthenticatedState extends AuthState {
  const UnAuthenticatedState(super.data, {this.showToast = false, this.openSignInPage = false});

  final bool openSignInPage;
  final bool showToast;
}

class AuthenticatedStateFail extends AuthState {
  const AuthenticatedStateFail(super.data, {required this.err});

  final String err;
}

class AuthenticatedState extends AuthState {
  const AuthenticatedState(
    super.data, {
    this.isRefresh = false,
    this.firstTimeLoginEver = false,
  });

  final bool firstTimeLoginEver;
  final bool isRefresh;
}
