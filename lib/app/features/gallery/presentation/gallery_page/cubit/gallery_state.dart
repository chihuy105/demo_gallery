part of 'gallery_cubit.dart';

enum GalleryStatus {
  initial,
}

class GalleryState extends Equatable {
  const GalleryState({
    this.status = GalleryStatus.initial,
    required this.item,
    this.errorMsg,
  });

  final GalleryStatus status;
  final dynamic item;
  final String? errorMsg;

  @override
  List<Object?> get props => [status, item, errorMsg];

  GalleryState copyWith({
    GalleryStatus? status,
    dynamic? item,
    String? errorMsg,
  }) {
    return GalleryState(
      status: status ?? this.status,
      item: item ?? this.item,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
