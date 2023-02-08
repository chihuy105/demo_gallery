part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.user,
    this.errorMsg,
  });

  final LoginStatus status;
  final UserModel? user;
  final String? errorMsg;

  @override
  List<Object?> get props => [status, user, errorMsg];

  LoginState copyWith({
    LoginStatus? status,
    UserModel? user,
    String? errorMsg,
  }) {
    return LoginState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
