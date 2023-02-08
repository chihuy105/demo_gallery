import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/presentation/item/cubit/gallery_item_cubit.dart';

class GalleryItemContent extends StatelessWidget {
  const GalleryItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryItemCubit, GalleryItemState>(
      builder: (context, state) {
        final item = state.item;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Img(
              item.src?.original,
              canZoom: true,
              fit: BoxFit.cover,
            ).cornerRadius(Dimens.rad).expand(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item.photographer?.text.maxLines(2).ellipsis.make().expand() ?? Gaps.empty,
                const AppCupertinoBtn(
                  padding: Dimens.edge_XS3,
                  child: Icon(Icons.favorite),
                )
              ],
            ).minHeight(40),
          ],
        );
      },
    );
  }
}
