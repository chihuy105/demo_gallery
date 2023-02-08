import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/auth/core/check_login_mixin.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';

part 'gallery_item_state.dart';

class GalleryItemCubit extends Cubit<GalleryItemState> with CheckLoginMixin {
  GalleryItemCubit({required PhotoModel item}) : super(GalleryItemState(item: item));

  FutureOr<void> likeItem(BuildContext context) async {
    actionOnLoginFunc(
      context,
      onLogin: (user) {

      },
    );
  }
}
