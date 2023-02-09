import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/presentation/bookmark/bloc/user_book_mark_list_bloc.dart';
import 'package:demo_gallery/app/features/gallery/presentation/item/gallery_item_item.dart';

class BookmarkViewerBody extends StatelessWidget {
  const BookmarkViewerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBookMarkListBloc, UserBookMarkListState>(
      builder: (context, state) {
        return GridView.builder(
          padding: Dimens.edge,
          itemCount: state.listPhoto?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            final item = state.listPhoto.getOrNull(index);
            if (item == null) {
              return Gaps.empty;
            }
            return GalleryItem(
              key: ObjectKey(item),
              item: item,
              listName: 'Bookmark',
            );
          },
        );
      },
    );
  }
}
