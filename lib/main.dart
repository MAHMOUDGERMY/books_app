import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'featuers/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: KprimaryColor,
      ),
      home: const SplashView(),
    );
  }
}
