import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';
import 'package:demo_gallery/app/features/gallery/presentation/bookmark/bloc/user_book_mark_list_bloc.dart';
import 'package:demo_gallery/app/features/gallery/presentation/item/cubit/gallery_item_cubit.dart';

class GalleryItem extends StatelessWidget {
  const GalleryItem({super.key, required this.item, this.listName});

  final PhotoModel item;

  /// Tag of the current list name that use this widget when image show in multiple list
  final String? listName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryItemCubit(item: item),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GalleryItemCubit, GalleryItemState>(
            builder: (context, state) {
              final item = state.item;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Img(
                    item.src?.original,
                    tag: '${item.src?.original}$listName',
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
        },
      ),
    );
  }
}
