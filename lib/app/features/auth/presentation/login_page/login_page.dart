import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:demo_gallery/app/features/auth/presentation/login_page/cubit/login_cubit.dart';
import 'package:demo_gallery/app/features/auth/presentation/login_page/login_body.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _authState,
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: Builder(
            builder: (context) {
              return BlocListener<LoginCubit, LoginState>(
                listener: _onStateChanged,
                child: Scaffold(
                  appBar: BaseAppBar(
                    title: context.l10n.login,
                  ),
                  body: const _PageBodyLoading(
                    child: LoginBody(),
                  ),
                ),
              );
            },
        ),
      ),
    );
  }

  void _onStateChanged(BuildContext context, LoginState state) {
    if (state.status == LoginStatus.error) {
      DialogUtils.showAlertDialog(context, content: state.errorMsg);
    }
    else if (state.status == LoginStatus.success && state.user != null) {
      context.read<AuthBloc>().add(
        AuthenticatedEvent(
          user: state.user!,
        ),
      );
    }
  }

  void _authState(BuildContext context, AuthState state) {
    if (state is AuthenticatedState) {
      context.popRoute();
    }
  }
}

class _PageBodyLoading extends StatelessWidget {
  const _PageBodyLoading({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AppTopLayout.loadingOnTop(
          loadingType: AppTopLayoutLoadingType.iosLoading,
          isLoading: state.status == LoginStatus.loading,
          child: child,
        );
      },
    );
  }
}
