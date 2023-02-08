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
                AppCupertinoBtn(
                  padding: Dimens.edge_XS3,
                  child: const Icon(Icons.favorite),
                  onPressed: () {
                    context.read<GalleryItemCubit>().likeItem(context);
                  },
                )
              ],
            ).minHeight(40),
          ],
        );
      },
    );
  }
}
