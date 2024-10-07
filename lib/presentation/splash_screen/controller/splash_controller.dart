import 'package:finance_digest/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToNextScreen();
    });
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Get.offNamed(AppRoutes.legalNameScereen);
  }
}
