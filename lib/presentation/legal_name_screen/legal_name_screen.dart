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
                  child: Container(
                    child: InputField(
                      type: InputType.firstname,
                      placeholder: "First name",
                      controller: controller.firstnameController,
                      onChanged: (String text) {
                        isTyped.value = text.isNotEmpty;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    child: InputField(
                      type: InputType.lastname,
                      placeholder: "Last name",
                      controller: controller.lastnameController,
                      onChanged: (String text) {
                        isTyped.value = text.isNotEmpty;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        return FloatingActionButton(
          backgroundColor:
              isTyped.value ? ColorConstant.buttonColor : ColorConstant.button,
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
        );
      }),
    );
  }
}
