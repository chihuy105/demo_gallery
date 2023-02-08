import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';

part 'gallery_item_state.dart';

class GalleryItemCubit extends Cubit<GalleryItemState> {
  GalleryItemCubit({required PhotoModel item}) : super(GalleryItemState(item: item));

  FutureOr<void> likeItem() async {

  }
}
