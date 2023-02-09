import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/presentation/bookmark/bloc/user_book_mark_list_bloc.dart';
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
              item.src?.small,
              canZoom: true,
              fit: BoxFit.cover,
            ).cornerRadius(Dimens.rad).expand(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item.photographer?.text.maxLines(2).ellipsis.make().expand() ?? Gaps.empty,
                BlocBuilder<UserBookMarkListBloc, UserBookMarkListState>(
                  builder: (context, state) {
                    final itemSelected = context.read<UserBookMarkListBloc>().isItemSelected(photoId: item.id);
                    return AppCupertinoBtn(
                      padding: Dimens.edge_XS3,
                      child: Icon(itemSelected ? Icons.favorite : Icons.favorite_border),
                      onPressed: () {
                        if (itemSelected) {
                          context.read<GalleryItemCubit>().removeBookmarkItem(
                            context,
                          );
                        } else {
                          context.read<GalleryItemCubit>().bookmarkItem(
                            context,
                          );
                        }
                      },
                    );
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
