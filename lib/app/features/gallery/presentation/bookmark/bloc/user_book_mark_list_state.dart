part of 'user_book_mark_list_bloc.dart';

enum UserBookMarkListStatus {
  initial,
  loading,
  loaded,
  error,
}

class UserBookMarkListState extends Equatable {
  const UserBookMarkListState({
    this.status = UserBookMarkListStatus.initial,
    this.listPhoto,
    this.userId,
    this.errorMsg,
  });

  final UserBookMarkListStatus status;
  final String? userId;
  final List<PhotoModel>? listPhoto;
  final String? errorMsg;

  UserBookMarkListState clear() {
    return const UserBookMarkListState();
  }

  @override
  List<Object?> get props => [status, userId, listPhoto, errorMsg];

  UserBookMarkListState copyWith({
    UserBookMarkListStatus? status,
    String? userId,
    List<PhotoModel>? listPhoto,
    String? errorMsg,
  }) {
    return UserBookMarkListState(
      status: status ?? this.status,
      userId: userId ?? this.userId,
      listPhoto: listPhoto ?? this.listPhoto,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
