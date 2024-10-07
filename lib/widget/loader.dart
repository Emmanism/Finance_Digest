import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
   Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Center(
      child:
         Lottie.asset(
          'assets/images/animations/shimmer_animation.json',
          height: 200,
          width: MediaQuery.of(context).size.width / 1.8,
          fit: BoxFit.fill,
        ),
    
    );
  }
}