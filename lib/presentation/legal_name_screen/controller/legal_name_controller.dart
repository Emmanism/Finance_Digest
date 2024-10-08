import 'package:finance_digest/model/user_data.dart';
import 'package:finance_digest/presentation/notfication/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LegalNameController extends GetxController {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  var isFirstNameError = false.obs;
  var isLastNameError = false.obs;

  void onTapStore() async {
    if (firstnameController.text.isEmpty) {
      isFirstNameError.value = true;
    } else {
      isFirstNameError.value = false;
    }

    if (lastnameController.text.isEmpty) {
      isLastNameError.value = true;
    } else {
      isLastNameError.value = false;
    }

    if (!isFirstNameError.value && !isLastNameError.value) {
      var userBox = Hive.box<UserData>('userBox');

      UserData userData = UserData(
        firstName: firstnameController.text,
        lastName: lastnameController.text,
      );

      await userBox.put('userData', userData);
      Get.snackbar('Success', 'Account created Sucessfully');
      await Future.delayed(Duration(milliseconds: 1000));

      Get.to(const NotificationScreen(),
          transition: Transition.zoom, duration: Duration(seconds: 1));
    }
  }
}
