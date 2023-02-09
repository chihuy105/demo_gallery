import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:demo_gallery/app/features/gallery/presentation/bookmark_viewer/bookmark_viewer_body.dart';
import 'package:demo_gallery/app/features/gallery/presentation/bookmark_viewer/cubit/bookmark_viewer_cubit.dart';

class BookmarkViewerPage extends StatelessWidget {
  const BookmarkViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      BookmarkViewerCubit()
        ..fetchItem(),
      child: Builder(
        builder: (context) {
          return BlocListener<BookmarkViewerCubit, BookmarkViewerState>(
            listener: _onStateChanged,
            child: Scaffold(
              appBar: BaseAppBar(
                title: context.l10n.bookMark,
                args: const BaseAppBarArgs(
                    titleSpacing: 20,
                    actions: [
                      LogoutBtn()
                    ]
                ),
              ),
              body: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is! AuthenticatedState) {
                    return const LoginSection();
                  }

                  return const BookmarkViewerBody();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _onStateChanged(BuildContext context, BookmarkViewerState state) {
    if (state.status == ItemDetailStatus.error) {
      DialogUtils.showAlertDialog(context, content: state.errorMsg);
    }
  }
}

class LoginSection extends StatelessWidget {
  const LoginSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        context.l10n.loginRequiredMsg.text.center.make(),
        Btn(
          label: context.l10n.login,
          onPressed: () {
            context.pushRoute(const LoginRoute());
          },
        ).centered(),
      ].withDivider(Gaps.vGap16),
    );
  }
}

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! AuthenticatedState) {
          return Gaps.empty;
        }
        return Btn(
          label: context.l10n.logout,
          onPressed: () {
            context.read<AuthBloc>().add(UnAuthenticatedEvent());
          },
        );
      },
    );
  }
}
