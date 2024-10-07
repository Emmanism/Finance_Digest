import 'package:finance_digest/presentation/notfication/controller/notfication_controller.dart';
import 'package:finance_digest/widget/button.dart';
import 'package:finance_digest/widget/color_constant.dart';
import 'package:finance_digest/widget/custom_image_view.dart';
import 'package:finance_digest/widget/image_constant.dart';
import 'package:finance_digest/widget/textcustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteScreen,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space between content and button
          children: [
            Expanded(
              // This expands the content to the center
              child: Center(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers the content
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgFrameMessage,
                      height: 98,
                      width: 98,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextCustom(
                          text: 'Get the most out of Blott ✅',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: ColorConstant.blottColor,
                          textAlign: TextAlign.center,
                          isTitle: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        height: 48,
                        width: 327,
                        child: Align(
                          alignment: Alignment.center,
                          child: TextCustom(
                            text:
                                'Allow notifications to stay in the loop with your payments, requests and groups.',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: ColorConstant.faintColor,
                            maxLines: 100,
                            textAlign: TextAlign.center,
                            isTitle: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Button(
                label: "Continue",
                onPressed: () {
                  controller.showAlertDialog(context);
                },
                type: ButtonType.ACTION,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
