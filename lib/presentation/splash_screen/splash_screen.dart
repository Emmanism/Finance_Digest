import 'package:finance_digest/presentation/splash_screen/controller/splash_controller.dart';
import 'package:finance_digest/widget/color_constant.dart';
import 'package:finance_digest/widget/custom_image_view.dart';
import 'package:finance_digest/widget/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

   final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorConstant.splash,
      body: Center(
        child: Container(
          width: 188,
          height: 188,
          child: CustomImageView(
            svgPath: ImageConstant.imgFrameSplash,
            height: 75,
            width: 135,
          ),

        ),
      )
    );
  }
}