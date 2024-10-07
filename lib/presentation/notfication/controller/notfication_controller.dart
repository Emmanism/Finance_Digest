import 'package:finance_digest/presentation/dashboard/dashboard_screen.dart';
import 'package:finance_digest/widget/color_constant.dart';
import 'package:finance_digest/widget/textcustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  Future<void> showAlertDialog(BuildContext context) async {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: TextCustom(
            text: '“Blott” Would Like to Send You Notifications',
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: ColorConstant.splash,
            textAlign: TextAlign.center,
            maxLines: 100,
            isTitle: false,
          ),
          content: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextCustom(
              text:
                  'Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.',
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: ColorConstant.splash,
              textAlign: TextAlign.center,
              maxLines: 100,
              isTitle: false,
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black, width: 0.5),
                  right: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
              child: CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: TextCustom(
                  text: 'Don\'t Allow',
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: ColorConstant.dialogColor,
                  textAlign: TextAlign.center,
                  maxLines: 100,
                  isTitle: false,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black, width: 0.5),
                  right: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
              child: CupertinoDialogAction(
                onPressed: () {
                  Get.to(
                    const DashboardScreen(),
                      transition: Transition.zoom,
                      duration: Duration(seconds: 1)
                    );
                },
                isDestructiveAction: true,
                child: TextCustom(
                  text: 'Allow',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: ColorConstant.dialogColor,
                  textAlign: TextAlign.center,
                  maxLines: 100,
                  isTitle: false,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
