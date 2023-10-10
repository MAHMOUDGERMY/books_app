import 'package:books_app/Features/home/domain/entities/book_entity.dart';
import 'package:books_app/Features/home/presntation/manager/feautred_books_cubit/feautred_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_featured_listview.dart';
import 'shimmer_loading_listview.dart';

class CustomFeaturedlistViewConsumer extends StatefulWidget {
  const CustomFeaturedlistViewConsumer({
    super.key,
  });

  @override
  State<CustomFeaturedlistViewConsumer> createState() =>
      _CustomFeaturedlistViewConsumerState();
}

class _CustomFeaturedlistViewConsumerState
    extends State<CustomFeaturedlistViewConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeautredBookCubit, FeautredBookState>(
      listener: (context, state) {
        if (state is FeautredBookSuccess) {
          books.addAll(state.books);
        }
        if (state is FeautredBookPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.failure_message),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ));
        }
      },
      builder: (context, state) {
        if (state is FeautredBookSuccess ||
            state is FeautredBookPaginationLoading ||
            state is FeautredBookPaginationFailure) {
          return CustomFeaturedListView(
            books: books,
          );
        } else if (state is FeautredBookFailure) {
          return Text(state.failure_message);
        } else {
          return const ShimmerLoadingListView();
        }
      },
    );
  }
}
