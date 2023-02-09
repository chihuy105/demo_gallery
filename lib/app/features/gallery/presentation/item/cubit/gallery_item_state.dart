part of 'gallery_item_cubit.dart';

enum GalleryItemStatus { initial }

class GalleryItemState extends Equatable {
  const GalleryItemState({
    this.status = GalleryItemStatus.initial,
    required this.item,
    this.isBookmarked = false,
    this.errorMsg,
  });

  final GalleryItemStatus status;
  final PhotoModel item;
  final bool isBookmarked;
  final String? errorMsg;

  @override
  List<Object?> get props => [status, item, isBookmarked, errorMsg];

  GalleryItemState copyWith({
    GalleryItemStatus? status,
    PhotoModel? item,
    bool? isBookmarked,
    String? errorMsg,
  }) {
    return GalleryItemState(
      status: status ?? this.status,
      item: item ?? this.item,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
