import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/presentation/bloc/auth_bloc.dart';

class NotLoginException implements Exception {}

mixin CheckLoginMixin {

  void actionOnLoginFunc(
    BuildContext context, {
    required void Function(UserModel? user) onLogin,
    VoidCallback? onDismiss,
  }) {
    final isLogin = context.read<AuthBloc>().isLogin;

    if (isLogin) {
      onLogin.call(context.read<AuthBloc>().state.data.user);
    } else {
      DialogUtils.showAlertDialog(
        context,
        content: 'Login to use this feature',
        positiveLabel: 'Login',
        positive: () {
          context.router.push(const LoginRoute()).then((value) {
            final userModel = context.read<AuthBloc>().state.data.user;
            if (userModel != null) {
              onLogin.call(userModel);
            } else {
              onDismiss?.call();
            }
          });
        },
        negative: () {
          logger.i('User cancel login');
          onDismiss?.call();
        },
      );
    }
  }
}
