import 'package:books_app/Features/home/data/models/book_model/book_model.dart';
import 'package:books_app/constants.dart';
import 'package:books_app/core/utils/api_service.dart';

import '../../../../core/functions/save_data.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endpint:
            "volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBooksList(data);
    saveData(books, KFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endpint: "volumes?Filtering=free-ebooks&Sorting=newest&q=programming");
    List<BookEntity> books = getBooksList(data);
    saveData(books, KNewestBox);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
