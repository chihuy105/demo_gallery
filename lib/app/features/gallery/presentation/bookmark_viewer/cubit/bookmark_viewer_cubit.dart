import 'package:demo_gallery/all_file/all_file.dart';

part 'bookmark_viewer_state.dart';

class BookmarkViewerCubit extends Cubit<BookmarkViewerState> {
  BookmarkViewerCubit({dynamic? item}) : super(BookmarkViewerState(item: item));

  FutureOr<void> fetchItem() async {
    emit(state.copyWith(status: ItemDetailStatus.loading));
    try {
      // final item = await Get.find<ApproveRepo>().getProgramForApprove(programID: item.programID ?? '');
      emit(
        state.copyWith(
          status: ItemDetailStatus.success,
          // item: item,
        )
      );
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
          status: ItemDetailStatus.error,
          errorMsg: e.getServerErrorMsg(),
        ),
      );
    }
  }
}
