import 'package:books_app/constants.dart';
import 'package:books_app/core/utils/assets.dart';
import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'best_seller_listview_item.dart';
import 'custom_appbar.dart';
import 'custom_featured_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const CustomFeaturedListView(),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Best Seller",
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: BestSellerListViewItem(),
            ),
          ))
        ],
      ),
    );
  }
}
