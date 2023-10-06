import 'package:books_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.fetchNewstBooksUseCase) : super(NewestBookInitial());

  final FetchNewestBooksUseCase fetchNewstBooksUseCase;
  Future<void> fetchFeautredBooks() async {
    emit(NewestBookLoading());

    var result = await fetchNewstBooksUseCase.call();

    result.fold(
      (failure) {
        emit(NewestBookFailure(failure.message));
      },
      (books) {
        emit(NewestBookSuccess(books: books));
      },
    );
  }
}
