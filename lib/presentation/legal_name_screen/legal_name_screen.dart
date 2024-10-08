import 'package:finance_digest/presentation/legal_name_screen/controller/legal_name_controller.dart';
import 'package:finance_digest/presentation/notfication/notification.dart';
import 'package:finance_digest/widget/color_constant.dart';
import 'package:finance_digest/widget/custom_image_view.dart';
import 'package:finance_digest/widget/image_constant.dart';
import 'package:finance_digest/widget/input_field.dart';
import 'package:finance_digest/widget/textcustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class LegalNameScreen extends StatelessWidget {
  LegalNameScreen({super.key});

  final LegalNameController controller = Get.put(LegalNameController());

  final RxBool isTyped = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteScreen,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextCustom(
                      text: 'Your legal name',
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: ColorConstant.splash,
                      textAlign: TextAlign.left,
                      isTitle: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 48,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextCustom(
                        text:
                            'We need to know a bit about you so that we can create your account.',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: ColorConstant.faintColor,
                        maxLines: 10,
                        isTitle: false,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Obx(() {
                    return Column(
                      children: [
                        InputField(
                          type: InputType.firstname,
                          placeholder: "First name",
                          controller: controller.firstnameController,
                          onChanged: (String text) {
                            isTyped.value = text.isNotEmpty;
                            controller.isFirstNameError.value = false;
                          },
                        ),
                        if (controller.isFirstNameError.value)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Enter your first name.',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Obx(() {
                    return Column(
                      children: [
                        InputField(
                          type: InputType.lastname,
                          placeholder: "Last name",
                          controller: controller.lastnameController,
                          onChanged: (String text) {
                            isTyped.value = text.isNotEmpty;
                              controller.isLastNameError.value = false;
                          },
                        ),
                        if (controller.isLastNameError.value)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Enter your last name.',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SafeArea(
        child: Obx(() {
          return FloatingActionButton(
            backgroundColor: isTyped.value
                ? ColorConstant.buttonColor
                : ColorConstant.button,
            onPressed: () {
              controller.onTapStore();
            },
            child: CustomImageView(
              svgPath: ImageConstant.imgFrameArrow,
              height: 24,
              width: 24,
              color: ColorConstant.whiteScreen,
            ),
            shape: CircleBorder(side: BorderSide.none),
          )
              .animate(
                delay: Duration(seconds: 1),
                onPlay: (controller) =>
                    controller.repeat(period: Duration(seconds: 3)),
              )
              .shakeY(delay: Duration(seconds: 1));
        }),
      ),
    );
  }
}
