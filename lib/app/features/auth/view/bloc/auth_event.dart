part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthFirstLoadUserEvent extends AuthEvent {
  AuthFirstLoadUserEvent();
}

class AuthFetchUserEvent extends AuthEvent {
  final bool fetchLoveList;

  AuthFetchUserEvent({this.fetchLoveList = false});
}

class AuthenticatedEvent extends AuthEvent {
  final String token;
  final String? avatar;
  final bool firstTime;
  final bool isRefresh;

  AuthenticatedEvent({
    this.isRefresh = false,
    required this.token,
    this.avatar,
    this.firstTime = false,
  });
}

class UnAuthenticatedEvent extends AuthEvent {
  final bool openSignInPage;
  final bool showToast;

  UnAuthenticatedEvent({this.showToast = false, this.openSignInPage = false});
}
