import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/core/dio/dio_module.dart';
import 'package:demo_gallery/services/user_secure_storage_service.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitialState(AuthData())) {
    _userSecureStorage = getIt<UserSecureStorage>();
    // _authRepo = getIt<AuthRepo>();
    // _userRepo = userRepo ?? getIt<UserRepo>();

    on<AuthFirstLoadUserEvent>(_onFirstLoadAuthEvent);
    on<AuthFetchUserEvent>(_onAuthFetchUserEvent);
    on<AuthenticatedEvent>(_onAuthenticatedEvent);
    on<UnAuthenticatedEvent>(_onUnAuthenticatedEvent);
  }

  late final UserSecureStorage _userSecureStorage;
  // late final AuthRepo _authRepo;
  // late final UserRepo _userRepo;

  FutureOr<void> _onFirstLoadAuthEvent(AuthFirstLoadUserEvent event, Emitter<AuthState> emit) {
    emit(AuthLoadingState(state.data));
    logger.i(_userSecureStorage.user);

    try {
      if (_userSecureStorage.token == null) {
        add(UnAuthenticatedEvent());
      } else {
        add(AuthenticatedEvent(
          token: _userSecureStorage.token ?? '',
          avatar: _userSecureStorage.socialAvatar ?? '',
          firstTime: false,
          isRefresh: true,
        ));
      }
    } catch (e) {
      logger.e(e);
      emit(AuthenticatedStateFail(state.data, err: e.getServerErrorMsg()));
    }
  }

  Future<void> _onAuthFetchUserEvent(AuthFetchUserEvent event, Emitter<AuthState> emit) async {
    try {
      // var user = await _userRepo.getUserProfile();
      // _userSecureStorage.setUserModel(user);
      // if (event.fetchLoveList) {
      //   _loveRepo.loadLoveListAll(
      //     delayFetch: const Duration(seconds: 3),
      //   );
      // }
      //
      // emit(AuthenticatedState(
      //   state.data.copyWith(userModel: user),
      //   isRefresh: true,
      // ));
    } catch (e) {
      logger.e(e);
      emit(AuthenticatedStateFail(state.data, err: e.getServerErrorMsg()));
    }
  }

  Future<void> _onAuthenticatedEvent(AuthenticatedEvent event, Emitter<AuthState> emit) async {
    try {
      // await setUserInfo(
      //   token: event.token,
      //   avatar: event.avatar,
      // );
      //
      // var user = await _userRepo.getUserProfile();
      // List<AdminPermissionTypes>? adminRole;
      // if (user.isAdmin()) {
      //   adminRole = await _userRepo.getAdminRole();
      // }
      // _userSecureStorage.setUserModel(user);
      // _loveRepo.loadLoveListAll(
      //   delayFetch: const Duration(seconds: 3),
      // );
      //
      // emit(
      //   AuthenticatedState(
      //     state.data.copyWith(
      //       userModel: user,
      //       adminRoleList: adminRole,
      //     ),
      //     firstTimeLoginEver: event.firstTime,
      //     isRefresh: event.isRefresh,
      //   ),
      // );
    } catch (e) {
      logger.e(e);
      emit(AuthenticatedStateFail(state.data, err: e.getServerErrorMsg()));
    }
  }

  Future<FutureOr<void>> _onUnAuthenticatedEvent(UnAuthenticatedEvent event, Emitter<AuthState> emit) async {
    try {
      if (_userSecureStorage.token.isNotNullOrEmpty()) {
        try {
          // await _authRepo.logout();
        } catch (e) {
          logger.e(e);
        }
      }
      await removeUserInfo();

      emit(UnAuthenticatedState(
        state.data.updateUser(
          userModel: null,
        ),
        openSignInPage: event.openSignInPage,
        showToast: event.showToast,
      ));
    } catch (e) {
      logger.e(e);
      emit(AuthenticatedStateFail(state.data, err: e.getServerErrorMsg()));
    }
  }

  Future<void> removeUserInfo() async {
    // getIt<DioModule>().removeToken();
    await _userSecureStorage.clear();
  }

  Future<void> setUserInfo({required String token, String? avatar}) async {
    _userSecureStorage.setToken(token);
    _userSecureStorage.unAuthorized.value = false;
    // SocketIOService.instance.setToken(token: token);
    getIt<DioModule>().addToken(token);

    if (avatar.isNotNullOrEmpty()) {
      // await _userRepo.updateUserAvatarStr(
      //   avatarStr: avatar ?? '',
      // );
    }
  }

  bool get isLogin => state.data.userModel != null;

  String? get userID => state.data.userModel?.userId;

  UserModel? get user => state.data.userModel;

  bool isAdmin() {
    return true;
  }

  @override
  Future<void> close() async {
    return super.close();
  }

}
