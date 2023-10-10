import 'package:books_app/Features/home/domain/entities/book_entity.dart';
import 'package:books_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'feautred_book_state.dart';

class FeautredBookCubit extends Cubit<FeautredBookState> {
  FeautredBookCubit(this.fetchFeaturedBooksUseCase)
      : super(FeautredBookInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeautredBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeautredBookLoading());
    } else {
      emit(FeautredBookPaginationLoading());
    }

    var result = await fetchFeaturedBooksUseCase.call(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeautredBookFailure(failure.message));
        } else {
          emit(FeautredBookPaginationFailure(failure.message));
        }
      },
      (books) {
        emit(FeautredBookSuccess(books: books));
      },
    );
  }
}
