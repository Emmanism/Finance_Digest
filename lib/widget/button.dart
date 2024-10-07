import 'package:finance_digest/widget/color_constant.dart';
import 'package:finance_digest/widget/textcustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ButtonType { ACTION, }

class Button extends StatelessWidget {
  final Function onPressed;
  final String label;
  final dynamic type;
  final Color? color;

  const Button({
    super.key,

    // BootstrapIcons.browser_chrome is a rarely used icon
    // So it is used as a default value to resolve non-nullable assignment
    required this.onPressed,
    required this.label,
    required this.type,
    this.color,
  });

  Map<String, Color>? buttonProperties(BuildContext context) {
    switch (type) {
      case ButtonType.ACTION:
        return {
          'color': ColorConstant.buttonColor,
          'foregroundColor': ColorConstant.buttonColor,
          'textColor': ColorConstant.whiteScreen,
        };
     
      default:
        return {
          'color': ColorConstant.buttonColor,
          'foregroundColor': ColorConstant.buttonColor,
          'textColor': color ?? ColorConstant.buttonColor,
        };
    }
  }

 
  void _onPressed() {
    onPressed();
  }

  Widget button(BuildContext context) {
    return SizedBox(
        width: 327,
        height: 48.0,
        child: ElevatedButton(
          onPressed: _onPressed,
          style: ElevatedButton.styleFrom(
              foregroundColor: buttonProperties(context)?['foregroundColor'],
              backgroundColor: buttonProperties(context)?['color'],
              shadowColor: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Align(
                  alignment: Alignment.center,
                  child: TextCustom(
                    text: label,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: ColorConstant.buttonTextColor,
                    textAlign: TextAlign.center,
                    isTitle: false,
                  ),
                ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    
    return button(context);
  }
}
