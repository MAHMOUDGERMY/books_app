import 'package:books_app/Features/home/presntation/manager/feautred_books_cubit/feautred_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_featured_listview.dart';

class CustomFeaturedlistViewBuilder extends StatelessWidget {
  const CustomFeaturedlistViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeautredBookCubit, FeautredBookState>(
      builder: (context, state) {
        if (state is FeautredBookSuccess) {
          return CustomFeaturedListView(
            books: state.books,
          );
        } else if (state is FeautredBookFailure) {
          return Text(state.failure_message);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
