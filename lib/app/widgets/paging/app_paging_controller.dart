import 'package:demo_gallery/all_file/all_file.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AppPagingController<PageKeyType, ItemType>
    extends PagingController<PageKeyType, ItemType> {
  AppPagingController({required PageKeyType firstPageKey})
      : super(firstPageKey: firstPageKey);

  Future<List<ItemType>> Function(PageKeyType offset, int limit)? fetchListData;
  int? pageSize;

  void init(
      {required Future<List<ItemType>> Function(PageKeyType offset, int limit)
          fetchListDataParam,
      required int pageSizeParam}) {
    fetchListData = fetchListDataParam;
    pageSize = pageSizeParam;
  }

  void clearAndRefresh() {
    itemList = [];
    refresh();
  }

  void refreshSilent({List<ItemType>? updateItemList, int? limit}) {
    if (updateItemList.isNotNullOrEmpty()) {
      itemList = [...updateItemList ?? []];
      return;
    }
    logger.d('refreshSilent');

    var itemCurrentLength =
        (itemList?.length ?? 0) > 0 ? itemList?.length : null;

    fetchListData
        ?.call(
            0 as PageKeyType,
            limit ??
                itemCurrentLength ??
                pageSize ??
                AppConstant.PAGE_SIZE_DEFAULT)
        .then((value) {
      itemList = [...value];
    });
  }

  void refreshList() {
    itemList = [...?itemList];
  }

  void filterItem({
    required bool Function(ItemType item) conditionMethod,
  }) {
    itemList = [...itemList.filterAsList(conditionMethod)];
  }

  bool updateItem({
    required ItemType? item,
    required bool Function(ItemType? oldItem, ItemType? item) checkFunction,
    bool? addHeadNotFound,
    bool? addTailNotFound,
  }) {
    logger.i('updateItem ${item.toString()}');

    if (itemList.isNullOrEmpty() || item == null) return false;

    final indexUpdate =
        itemList?.indexWhere((oldItem) => checkFunction(oldItem, item));
    if ((indexUpdate ?? -1) > -1) {
      itemList![indexUpdate!] = item;
      itemList = [...?itemList];
      logger.i('updateItem done');
      return true;
    } else if (addHeadNotFound ?? false) {
      logger.i('addHeadNotFound');
      itemList = [item, ...?itemList];
    } else if (addTailNotFound ?? false) {
      logger.i('addTailNotFound');
      itemList = [...?itemList, item];
    }

    logger.i('updateItem false');
    return false;
  }

  bool updateOrFetchItem({
    required bool Function(ItemType? oldItem) checkFunction,
  }) {
    if (itemList.isNullOrEmpty()) return false;

    final indexUpdate =
        itemList?.indexWhere((oldItem) => checkFunction(oldItem));
    if (indexUpdate != null && indexUpdate != -1) {
      fetchListData?.call(indexUpdate as PageKeyType, 1).then((value) {
        itemList![indexUpdate] = value.firstOrNull() ?? itemList![indexUpdate];
        itemList = [...?itemList];
      });
    }
    return false;
  }
}
