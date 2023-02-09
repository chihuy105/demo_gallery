import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/features/gallery/data/datasource/bookmark_storage_service.dart';
import 'package:demo_gallery/app/features/gallery/data/model/gallery_base_model.dart';

part 'user_book_mark_list_event.dart';

part 'user_book_mark_list_state.dart';

class UserBookMarkListBloc extends Bloc<UserBookMarkListEvent, UserBookMarkListState> {
  UserBookMarkListBloc({BookmarkStorageService? bookmarkStorageService}) : super(const UserBookMarkListState()) {
    _bookmarkStorageService = bookmarkStorageService ?? getIt();

    on<UserBookMarkListGetEvent>(_onUserBookMarkListGetEvent);
    on<UserBookMarkListAddEvent>(_onUserBookMarkListAddEvent);
    on<UserBookMarkListRemoveEvent>(_onUserBookMarkListRemoveEvent);
    on<UserBookMarkListClearEvent>(_onUserBookMarkListClearEvent);
  }

  late final BookmarkStorageService _bookmarkStorageService;

  List<PhotoModel> getListBookmark() {
    return state.listPhoto ?? [];
  }

  bool isItemSelected({required int? photoId}) {
    return state.listPhoto.find((item) => item.id == photoId) != null;
  }

  FutureOr<void> _onUserBookMarkListGetEvent(UserBookMarkListGetEvent event, Emitter<UserBookMarkListState> emit) async {
    try {
      final userBookMarkList = await _bookmarkStorageService.getUserBookMarkList(userId: event.userId);
      emit(
        state.copyWith(
          listPhoto: userBookMarkList,
          status: UserBookMarkListStatus.loaded,
          userId: event.userId,
        ),
      );
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
          status: UserBookMarkListStatus.error,
          errorMsg: 'Get list from local storage fail',
        ),
      );
    }
  }

  FutureOr<void> _onUserBookMarkListAddEvent(UserBookMarkListAddEvent event, Emitter<UserBookMarkListState> emit) async {
    try {
      if (state.status != UserBookMarkListStatus.loaded || state.userId.isNullOrEmpty()) {
        return;
      }
      final listWithoutItem = state.listPhoto.filterAsList((item) => item.id != event.photo.id);
      final rsList = [...listWithoutItem, event.photo];
      await _bookmarkStorageService.saveUserBookMarkList(
        userId: state.userId!,
        photoList: rsList,
      );
      emit(
        state.copyWith(
          listPhoto: rsList,
          status: UserBookMarkListStatus.loaded,
        ),
      );
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
          status: UserBookMarkListStatus.error,
          errorMsg: 'Add item to bookmark list fail',
        ),
      );
    }
  }

  FutureOr<void> _onUserBookMarkListRemoveEvent(UserBookMarkListRemoveEvent event, Emitter<UserBookMarkListState> emit) async {
    try {
      if (state.status != UserBookMarkListStatus.loaded || state.userId.isNullOrEmpty()) {
        return;
      }
      final rsList = state.listPhoto.filterAsList((item) => item.id != event.photo.id);
      await _bookmarkStorageService.saveUserBookMarkList(
        userId: state.userId!,
        photoList: rsList,
      );
      emit(
        state.copyWith(
          listPhoto: rsList,
          status: UserBookMarkListStatus.loaded,
        ),
      );
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
          status: UserBookMarkListStatus.error,
          errorMsg: 'Remove item to bookmark list fail',
        ),
      );
    }
  }

  FutureOr<void> _onUserBookMarkListClearEvent(UserBookMarkListClearEvent event, Emitter<UserBookMarkListState> emit) {
    if (event.removeUser) {
      emit(
        state.clear(),
      );
    }else{
      emit(
        state.copyWith(
          listPhoto: [],
        ),
      );
    }

  }
}
