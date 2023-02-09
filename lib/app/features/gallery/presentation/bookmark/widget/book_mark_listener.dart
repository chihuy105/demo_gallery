import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:demo_gallery/app/features/gallery/presentation/bookmark/bloc/user_book_mark_list_bloc.dart';

class BookMarkListener extends StatelessWidget {
  const BookMarkListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _authStateChange,
      child: child,
    );
  }

  void _authStateChange(BuildContext context, AuthState state) {
    if (state is AuthenticatedState) {
      context.read<UserBookMarkListBloc>().add(
            UserBookMarkListGetEvent(
              userId: state.data.user?.userId ?? '',
            ),
          );
    } else if (state is UnAuthenticatedState) {
      context.read<UserBookMarkListBloc>().add(
            UserBookMarkListClearEvent(
              removeUser: true,
            ),
          );
    }
  }
}
