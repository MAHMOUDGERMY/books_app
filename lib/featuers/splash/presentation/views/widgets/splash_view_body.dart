import 'package:books_app/constants.dart';
import 'package:books_app/core/utils/assets.dart';
import 'package:books_app/featuers/home/presntation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {

  late AnimationController animationController ;
  late Animation<Offset> slidingAnimation;
  @override

  void initState() {

    super.initState();
    initSlideAnimation();
    NavigateToHome();


  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
         AnimatedBuilder(
           animation: slidingAnimation,
           builder: (context , _) {
             return SlideTransition(
                position: slidingAnimation ,
                 child:
       const Text(
              "Read free books",
              textAlign: TextAlign.center,
        ));
           }
         ),
      ],
    );
  }
  void NavigateToHome(){
    Future.delayed(const Duration(seconds: 2 ) , ((){
      Get.to(()=>const Home_view()  ,transition: Transition.downToUp , duration: kTransitionDuration);
    }));
  }
  void initSlideAnimation(){
    animationController = AnimationController(
      vsync: this ,
      duration: const Duration(seconds: 1 ),
    );
    slidingAnimation = Tween<Offset>(begin:const Offset(0 , 10), end: Offset.zero).animate(animationController);

    animationController.forward();
  }
}
