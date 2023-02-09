part of 'user_book_mark_list_bloc.dart';

@immutable
abstract class UserBookMarkListEvent {}


class UserBookMarkListGetEvent extends UserBookMarkListEvent{
  UserBookMarkListGetEvent({required this.userId});

  final String userId;
}

class UserBookMarkListAddEvent extends UserBookMarkListEvent{
  UserBookMarkListAddEvent({required this.photo});

  final PhotoModel photo;
}

class UserBookMarkListRemoveEvent extends UserBookMarkListEvent{
  UserBookMarkListRemoveEvent({required this.photo});

  final PhotoModel photo;
}

class UserBookMarkListClearEvent extends UserBookMarkListEvent{
  UserBookMarkListClearEvent();
}