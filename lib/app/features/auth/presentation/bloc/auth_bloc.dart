import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/data/repo/auth_repo.dart';
import 'package:demo_gallery/core/dio/dio_module.dart';
import 'package:demo_gallery/services/user_secure_storage_service.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({AuthRepo? authRepo}) : super(const AuthInitialState(AuthData())) {
    _userSecureStorage = getIt<UserStorage>();
    _authRepo = authRepo ?? getIt<AuthRepo>();

    on<AuthFirstLoadUserEvent>(_onFirstLoadAuthEvent);
    on<AuthenticatedEvent>(_onAuthenticatedEvent);
    on<UnAuthenticatedEvent>(_onUnAuthenticatedEvent);
  }

  late final UserStorage _userSecureStorage;

  late final AuthRepo _authRepo;

  FutureOr<void> _onFirstLoadAuthEvent(AuthFirstLoadUserEvent event, Emitter<AuthState> emit) {
    emit(AuthLoadingState(state.data));
    logger.i(_userSecureStorage.user);

    try {
      final currentUser = _authRepo.getCurrentUser();
      if (currentUser == null) {
        add(UnAuthenticatedEvent());
      } else {
        add(
          AuthenticatedEvent(
            firstTime: false,
            isRefresh: true,
            user: currentUser,
          ),
        );
      }
    } catch (e) {
      logger.e(e);
      emit(AuthenticatedStateFail(state.data, err: e.getServerErrorMsg()));
    }
  }

  Future<void> _onAuthenticatedEvent(AuthenticatedEvent event, Emitter<AuthState> emit) async {
    try {
      await _userSecureStorage.setUserModel(event.user);
      emit(
        AuthenticatedState(
          state.data.copyWith(
            user: event.user,
          ),
          firstTimeLoginEver: event.firstTime,
          isRefresh: event.isRefresh,
        ),
      );
    } catch (e) {
      logger.e(e);
      emit(AuthenticatedStateFail(state.data, err: e.getServerErrorMsg()));
    }
  }

  Future<FutureOr<void>> _onUnAuthenticatedEvent(UnAuthenticatedEvent event, Emitter<AuthState> emit) async {
    try {
      if (_userSecureStorage.user != null) {
        try {
          await _authRepo.logout();
        } catch (e) {
          logger.e(e);
        }
      }
      await removeUserInfo();

      emit(UnAuthenticatedState(
        state.data.update(
          user: null,
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
    await _userSecureStorage.clear();
  }

  bool get isLogin => state.data.user != null;

  String? get userID => state.data.user?.userId;

  UserModel? get user => state.data.user;

  bool isAdmin() {
    return true;
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
