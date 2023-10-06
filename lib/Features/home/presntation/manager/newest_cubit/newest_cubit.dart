import 'package:bloc/bloc.dart';
import 'package:books_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_state.dart';

class NewestCubit extends Cubit<NewestBookState> {
  NewestCubit(this.fetchNewstBooksUseCase) : super(NewestBookInitial());

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
