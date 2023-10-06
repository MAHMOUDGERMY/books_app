import 'package:bloc/bloc.dart';
import 'package:books_app/Features/home/domain/entities/book_entity.dart';
import 'package:books_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';

part 'feautred_book_state.dart';

class FeautredBookCubit extends Cubit<FeautredBookState> {
  FeautredBookCubit(this.fetchFeaturedBooksUseCase)
      : super(FeautredBookInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeautredBooks() async {
    emit(FeautredBookLoading());

    var result = await fetchFeaturedBooksUseCase.call();

    result.fold(
      (failure) {
        emit(FeautredBookFailure(failure.message));
      },
      (books) {
        emit(FeautredBookSuccess(books: books));
      },
    );
  }
}
