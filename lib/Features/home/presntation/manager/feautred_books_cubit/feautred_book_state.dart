part of 'feautred_book_cubit.dart';

abstract class FeautredBookState {}

class FeautredBookInitial extends FeautredBookState {}

class FeautredBookLoading extends FeautredBookState {}

class FeautredBookSuccess extends FeautredBookState {
  final List<BookEntity> books;

  FeautredBookSuccess({required this.books});
}

class FeautredBookFailure extends FeautredBookState {
  final String failure_message;
  FeautredBookFailure(this.failure_message);
}
