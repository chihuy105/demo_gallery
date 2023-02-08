import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';
import 'package:demo_gallery/app/features/gallery/presentation/item/cubit/gallery_item_cubit.dart';
import 'package:demo_gallery/app/features/gallery/presentation/item/gallery_item_content.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({super.key, required this.item});

  final PhotoModel item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryItemCubit(item: item),
      child: Builder(
          builder: (context) {
            return const GalleryItemContent();
          }
      ),
    );
  }

}

