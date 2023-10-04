import 'package:flutter/material.dart';

import 'custom_listview_item.dart';

class CustomFeaturedListView extends StatelessWidget {
  const CustomFeaturedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(

          scrollDirection: Axis.horizontal,
          itemCount: 10, itemBuilder: (context ,index)=>const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8),
        child:  CustomListViewItem(),
      )),
    );
  }
}
