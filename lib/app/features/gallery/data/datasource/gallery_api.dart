import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';

part 'gallery_api.g.dart';

@RestApi()
abstract class GalleryApi {
  factory GalleryApi(Dio dio) = _GalleryApi;

  @GET('/v1/curated')
  Future<PhotoListResp?> getPhotoList({
    @Query('page') int? page,
    @Query('per_page') int? perPage,
  });

}
