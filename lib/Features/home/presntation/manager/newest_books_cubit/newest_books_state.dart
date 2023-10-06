part of 'newest_books_cubit.dart';

abstract class NewestBookState {}

class NewestBookInitial extends NewestBookState {}

class NewestBookLoading extends NewestBookState {}

class NewestBookSuccess extends NewestBookState {
  final List<BookEntity> books;

  NewestBookSuccess({required this.books});
}

class NewestBookFailure extends NewestBookState {
  final String failure_message;
  NewestBookFailure(this.failure_message);
}
