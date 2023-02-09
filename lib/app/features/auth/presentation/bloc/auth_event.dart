part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthFirstLoadUserEvent extends AuthEvent {
  AuthFirstLoadUserEvent();
}

class AuthenticatedEvent extends AuthEvent {
  AuthenticatedEvent({
    this.isRefresh = false,
    this.firstTime = false,
    required this.user,
  });

  final bool firstTime;
  final bool isRefresh;
  final UserModel user;
}

class UnAuthenticatedEvent extends AuthEvent {
  UnAuthenticatedEvent({this.showToast = false, this.openSignInPage = false});

  final bool openSignInPage;
  final bool showToast;
}
