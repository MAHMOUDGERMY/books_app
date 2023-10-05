import 'package:books_app/Features/home/presntation/views/widgets/best_seller_listview.dart';
import 'package:books_app/Features/home/presntation/views/widgets/book_rating.dart';
import 'package:books_app/Features/home/presntation/views/widgets/books_action.dart';
import 'package:books_app/Features/home/presntation/views/widgets/custom_book_details_appbar.dart';
import 'package:books_app/Features/home/presntation/views/widgets/custom_book_image.dart';
import 'package:books_app/Features/home/presntation/views/widgets/similer_books_listview.dart';
import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const CustomBookImage(),
          ),
          const SizedBox(
            height: 43,
          ),
          const Text(
            "The Jungle Book",
            style: Styles.textStyle30,
          ),
          const SizedBox(
            height: 6,
          ),
          Opacity(
            opacity: 0.7,
            child: Text(
              "Rudyard Kipling",
              style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 18,
          ),
          const BookActions(),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "you can also like ",
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SimilerBooksListView()
        ],
      ),
    );
  }
}
