import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';
import 'package:demo_gallery/app/features/gallery/presentation/gallery_main/cubit/gallery_cubit.dart';
import 'package:demo_gallery/app/widgets/paging/paging_grid.dart';

class GalleryBody extends StatelessWidget {

  const GalleryBody({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return PagingGrid<PhotoModel>(
      padding: Dimens.edge,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      fetchListData: context.read<GalleryCubit>().getPhotoList,
      itemBuilder: (context, item, index) {
        final photoItem = item;
        return Img(photoItem.src?.original);
      },
    );
  }
}
