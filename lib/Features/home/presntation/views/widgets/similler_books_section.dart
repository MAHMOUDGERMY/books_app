import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'similer_books_listview.dart';

class SimillerBooksSection extends StatelessWidget {
  const SimillerBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SimilerBooksListView(),
      ],
    );
  }
}
