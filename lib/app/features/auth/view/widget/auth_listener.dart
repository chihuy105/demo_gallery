import 'package:demo_gallery/all_file/all_file.dart';

import 'package:demo_gallery/app/features/auth/view/bloc/auth_bloc.dart';
import 'package:demo_gallery/services/user_secure_storage_service.dart';

class AuthListener extends StatelessWidget {
  const AuthListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StreamListener(
      stream: getIt<UserSecureStorage>().unAuthorized.stream,
      onData: (unAuthorized) {
        // TODO(Logout-Event): Check Logout event when 401
        // if (unAuthorized == true && getIt<AppAutoRoute>().current.name != UserProfileRoute.name) {
        //   context.read<AuthBloc>().add(UnAuthenticatedEvent());
        // }
      },
      child: Builder(
        builder: (context) {
          return BlocConsumer<AuthBloc, AuthState>(
            listener: _onAuthStateChange,
            builder: (context, state) {
              return child;
            },
          );
        },
      ),
    );
  }

  void _onAuthStateChange(BuildContext context, AuthState state) {
    if (state is AuthenticatedState) {
      if (!state.isRefresh) {
        String msg;
        if (state.firstTimeLoginEver) {
          msg = 'welcomeNewUser'.tr.replaceFirst('<user_name>', 'contactName');
        } else {
          msg = 'welcomeUser'.tr.replaceFirst('<user_name>', 'contactName');
        }
        ToastUtils.showToast(context: context, msg: msg, duration: const Duration(seconds: 3));
      }
    } else if (state is UnAuthenticatedState) {
      if (state.openSignInPage) {
        // widget.appRouter.push(SignInRoute());
        return;
      }

      if (state.showToast) {
        ToastUtils.showToast(
          context: context,
          msg: 'logout'.tr,
          duration: const Duration(seconds: 3),
        );
      }
    }
  }
}
