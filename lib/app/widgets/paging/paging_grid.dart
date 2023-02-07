import 'package:demo_gallery/all_file/all_file.dart';
import 'package:demo_gallery/app/widgets/refresh/app_pull_down_refresh.dart';
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

typedef PagingGridFetchFunc<T> = Future<List<T>> Function(int offset, int limit);

class PagingGrid<T> extends StatefulWidget {
  const PagingGrid({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.physics,
    this.padding,
    this.shrinkWrap = false,
    required this.itemBuilder,
    required this.fetchListData,
    this.separatorBuilder,
    this.pageSize = AppConstant.PAGE_SIZE_DEFAULT,
    this.pagingController,
    this.onlyOnePage = false,
    this.clearOnFirstPage = true,
    this.noItemsFoundIndicatorBuilder,
    this.noMoreItemsIndicatorBuilder,
    this.firstPageProgressIndicatorBuilder,
    this.newPageProgressIndicatorBuilder,
    this.onEmpty,
    this.reverse = false,
    this.enablePullDown = true,
    this.delayFetch,
    this.addPageRequest = true,
    this.scrollController,
    this.isSliver = false,
    required this.gridDelegate,
  });

  final AppPagingController<int, T>? pagingController;

  final bool isSliver;

  final int pageSize;
  final ItemWidgetBuilder<T> itemBuilder;
  final PagingGridFetchFunc<T> fetchListData;
  final IndexedWidgetBuilder? separatorBuilder;
  final WidgetBuilder? noItemsFoundIndicatorBuilder;
  final WidgetBuilder? noMoreItemsIndicatorBuilder;
  final WidgetBuilder? firstPageProgressIndicatorBuilder;
  final WidgetBuilder? newPageProgressIndicatorBuilder;
  final VoidCallback? onEmpty;

  final Duration? delayFetch;
  final bool addPageRequest;

  // Paging Params
  final bool onlyOnePage;
  final bool clearOnFirstPage;

  // ListView params
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;

  final bool reverse;
  final bool enablePullDown;

  final SliverGridDelegate gridDelegate;

  @override
  _PagingGridState<T> createState() => _PagingGridState();
}

class _PagingGridState<V> extends State<PagingGrid<V>> {
  late final AppPagingController<int, V> _pagingController;
  PageRequestListener<int>? listener;
  bool isEmpty = false;
  bool isDelayDone = true;

  @override
  void initState() {
    _pagingController = widget.pagingController ?? AppPagingController(firstPageKey: 0);
    _pagingController.init(fetchListDataParam: widget.fetchListData, pageSizeParam: widget.pageSize);

    if (widget.delayFetch != null) {
      isDelayDone = false;
      Future.delayed(widget.delayFetch ?? Duration.zero).then((value) {
        isDelayDone = true;
        _fetchPage(0);
      });
    }
    if (widget.addPageRequest == true) {
      _pagingController.addPageRequestListener((pageKey) {
        if (isDelayDone) {
          _fetchPage(pageKey);
        }
      });
    }

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await widget.fetchListData.call(pageKey, widget.pageSize);
      final isLastPage = (newItems.length) < widget.pageSize;

      if (widget.clearOnFirstPage && pageKey == 0) {
        _pagingController.itemList = [];
      }
      if (isLastPage || widget.onlyOnePage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + (newItems.length);
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      if (kDebugMode) {
        rethrow;
      }
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isEmpty) return Gaps.empty;

    Widget pagedListView;

    if (widget.isSliver) {
      if (widget.padding != null) {
        return SliverPadding(
          padding: widget.padding!,
          sliver: _buildSliver(),
        );
      }
      return _buildSliver();
    }

    pagedListView = _buildNormal();

    // This will shrink the list to minimum size possible
    if (!widget.enablePullDown && widget.shrinkWrap) {
      return pagedListView;
    }

    return AppPullDownRefresh(
      enable: widget.enablePullDown,
      refresh: _pagingController.refresh,
      child: pagedListView,
    );
  }

  PagedSliverGrid<int, V> _buildSliver() {
    return PagedSliverGrid<int, V>(
      gridDelegate: widget.gridDelegate,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<V>(
        itemBuilder: widget.itemBuilder,
        firstPageProgressIndicatorBuilder: widget.firstPageProgressIndicatorBuilder ?? (_) => AppLoading.defaultLoading(),
        newPageProgressIndicatorBuilder: widget.newPageProgressIndicatorBuilder ?? (_) => AppLoading.defaultLoading(),
        firstPageErrorIndicatorBuilder: (_) =>
            PageErrorNotify(
              error: _pagingController.error,
            ),
        newPageErrorIndicatorBuilder: (_) =>
            PageErrorNotify(
              error: _pagingController.error,
            ),
        noItemsFoundIndicatorBuilder: (context) {
          widget.onEmpty?.call();
          if (widget.noItemsFoundIndicatorBuilder != null) {
            return widget.noItemsFoundIndicatorBuilder?.call(context) ?? Gaps.empty;
          }
          return const PageEmptyNotify();
        },
        noMoreItemsIndicatorBuilder: widget.noMoreItemsIndicatorBuilder ?? (_) => Gaps.empty,
      ),
    );
  }

  PagedGridView<int, V> _buildNormal() {
    return PagedGridView<int, V>(
      gridDelegate: widget.gridDelegate,
      scrollController: widget.scrollController,
      reverse: widget.reverse,
      scrollDirection: widget.scrollDirection,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<V>(
        itemBuilder: widget.itemBuilder,
        firstPageProgressIndicatorBuilder: widget.firstPageProgressIndicatorBuilder ?? (_) => AppLoading.defaultLoading(),
        newPageProgressIndicatorBuilder: widget.newPageProgressIndicatorBuilder ?? (_) => AppLoading.defaultLoading(),
        firstPageErrorIndicatorBuilder: (_) =>
            PageErrorNotify(
              error: _pagingController.error,
            ),
        newPageErrorIndicatorBuilder: (_) =>
            PageErrorNotify(
              error: _pagingController.error,
            ),
        noItemsFoundIndicatorBuilder: (context) {
          widget.onEmpty?.call();
          if (widget.noItemsFoundIndicatorBuilder != null) {
            return widget.noItemsFoundIndicatorBuilder?.call(context) ?? Gaps.empty;
          }
          return const PageEmptyNotify();
        },
        noMoreItemsIndicatorBuilder: widget.noMoreItemsIndicatorBuilder ?? (_) => Gaps.empty,
      ),
    );
  }
}
