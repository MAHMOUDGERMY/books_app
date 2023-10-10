import 'package:books_app/Features/home/domain/entities/book_entity.dart';
import 'package:books_app/Features/home/presntation/manager/feautred_books_cubit/feautred_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class CustomFeaturedListView extends StatefulWidget {
  const CustomFeaturedListView({Key? key, required this.books})
      : super(key: key);
  final List<BookEntity> books;

  @override
  State<CustomFeaturedListView> createState() => _CustomFeaturedListViewState();
}

class _CustomFeaturedListViewState extends State<CustomFeaturedListView> {
  final ScrollController _scrollController = ScrollController();

  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    _scrollController.addListener(addListener);
    super.initState();
  }

  void addListener() async {
    if (_scrollController.position.pixels >=
        0.7 * _scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeautredBookCubit>(context)
            .fetchFeautredBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookImage(
                  image: widget.books[index].image ?? "",
                ),
              )),
    );
  }
}
