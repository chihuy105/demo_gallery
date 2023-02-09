import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/core/check_login_mixin.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';
import 'package:demo_gallery/app/features/gallery/presentation/bookmark/bloc/user_book_mark_list_bloc.dart';

part 'gallery_item_state.dart';

class GalleryItemCubit extends Cubit<GalleryItemState> with CheckLoginMixin {
  GalleryItemCubit({required PhotoModel item}) : super(GalleryItemState(item: item));

  FutureOr<void> bookmarkItem(BuildContext context) async {
    actionOnLoginFunc(
      context,
      onLogin: (user) {
        context.read<UserBookMarkListBloc>().add(
          UserBookMarkListAddEvent(
            photo: state.item,
          ),
        );
      },
    );
  }

  FutureOr<void> removeBookmarkItem(BuildContext context) async {
    actionOnLoginFunc(
      context,
      onLogin: (user) {
        context.read<UserBookMarkListBloc>().add(
          UserBookMarkListRemoveEvent(
            photo: state.item,
          ),
        );
      },
    );
  }
}
