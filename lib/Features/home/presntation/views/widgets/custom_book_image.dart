import 'package:books_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsData.book1), fit: BoxFit.fill)),
      ),
    );
  }
}
