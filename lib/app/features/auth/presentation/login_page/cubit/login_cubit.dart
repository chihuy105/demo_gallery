import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/data/repo/auth_exception.dart';
import 'package:demo_gallery/app/features/auth/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({AuthRepo? authRepo}) : super(const LoginState()) {
    _authRepo = authRepo ?? getIt();
  }

  late final AuthRepo _authRepo;

  Future<void> loginGG() async {
    if (state.status == LoginStatus.loading) {
      return;
    }
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      final user = await _authRepo.signInWithGG();

      emit(
        state.copyWith(
          status: LoginStatus.success,
          user: user,
        ),
      );
    } catch (e) {
      if (e is LogInWithSocialCancel) {
        emit(state.copyWith(status: LoginStatus.initial));
      } else if (e is LogInWithSocialFailure) {
        emit(
          state.copyWith(
            status: LoginStatus.error,
            errorMsg: e.message,
          ),
        );
        return;
      } else {
        emit(
          state.copyWith(
            status: LoginStatus.error,
            errorMsg: e.getServerErrorMsg(),
          ),
        );
        return;
      }
    }
  }
}
