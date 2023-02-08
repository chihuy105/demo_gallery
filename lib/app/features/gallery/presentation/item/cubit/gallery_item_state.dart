part of 'gallery_item_cubit.dart';

enum GalleryItemStatus{
  initial
}

class GalleryItemState extends Equatable {
  const GalleryItemState({
    this.status = GalleryItemStatus.initial,
    required this.item,
    this.errorMsg,
  });

  final GalleryItemStatus status;
  final PhotoModel item;
  final String? errorMsg;

  @override
  List<Object?> get props => [status, item, errorMsg];

  GalleryItemState copyWith({
    GalleryItemStatus? status,
    PhotoModel? item,
    String? errorMsg,
  }) {
    return GalleryItemState(
      status: status ?? this.status,
      item: item ?? this.item,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
