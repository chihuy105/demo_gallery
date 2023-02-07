import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';
import 'package:demo_gallery/app/features/gallery/data/repo/gallery_repo.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit({dynamic? item}) : super(GalleryState(item: item)) {
    _galleryRepo = getIt();
  }

  late final GalleryRepo _galleryRepo;

  Future<List<PhotoModel>> getPhotoList(
    int page,
    int perPage,
  ) {
    return _galleryRepo.getPhotoList(
      page: page,
      perPage: perPage,
    );
  }
}
