import 'package:finance_digest/widget/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

enum InputType { firstname, lastname, text }

class InputField extends StatefulWidget {
  final String placeholder;
  final Function(String text) onChanged;
  final bool hasError;
  final dynamic type;
  final Widget? prefix;
  final double? height;
  final Widget? suffix;
  final int maxLength;
  final String response;
  final Color? color;
  final String helper;
  final int? maline;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final bool isValidateText;

  const InputField({
    super.key,
    this.type = InputType.firstname,
    this.hasError = false,
    this.prefix,
    this.suffix,
    this.height,
    this.response = "",
    this.color,
    this.helper = "",
    this.maline,
    this.textInputAction = TextInputAction.done,
    this.maxLength = 30,
    this.isValidateText = true,
    required this.onChanged,
    required this.placeholder,
    required this.controller,
  });

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  final FocusNode focusNode = FocusNode();
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    bool validator(String input) {
      RegExp regex = RegExp(r".*");

      switch (widget.type) {
        case InputType.firstname:
          regex = RegExp(r"^[a-zA-Z ]+$");
        case InputType.lastname:
          regex = RegExp(r"^[a-zA-Z ]+$");
        case InputType.text:
          regex = RegExp(r".+");
      }

      if (input.isEmpty | !widget.isValidateText) {
        return true;
      }

      return regex.hasMatch(input);
    }

    TextInputType inputType() {
      switch (widget.type) {
        case InputType.firstname:
          return TextInputType.name;
        case InputType.lastname:
          return TextInputType.name;
        case InputType.text:
          return TextInputType.text;
      }
      return TextInputType.text;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: widget.height ?? 50.0,
          child: TextFormField(
              textInputAction: widget.textInputAction,
              
              controller: widget.controller,
              focusNode: focusNode,
              autofocus: false,
              obscuringCharacter: "*",
              keyboardType: inputType(),
              maxLines: widget.maline ?? 1,
              textAlignVertical: TextAlignVertical.bottom,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                LengthLimitingTextInputFormatter(widget.maxLength),
              ],
              validator: (value) {
                if (validator(value!)) {
                  return null;
                } else {
                  return "Invalid Name!";
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: widget.color ?? Colors.white,
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  // fontFamily: CustomTheme.of(context).titleMediumFamily,
                  color: ColorConstant.userColor,
                  letterSpacing: 0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal:0.0, vertical: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstant
                        .faintColor, // Bottom border color when focused
                    width: 1.0,
                  ),
                ),
                errorStyle: const TextStyle(fontSize: 0.0),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstant.userColor, 
                    width: 1.0, 
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: 
              GoogleFonts.getFont(
                 'Roboto',
                  fontSize: 20, 
                  fontWeight: FontWeight.w600, 
                  color: ColorConstant.blackColor, 
                  letterSpacing: 0
                  ),
      
              onChanged: (input) {
                setState(() {
                  hasError = !validator(input);
                });
                widget.onChanged(input);
              },
              onTap: () {
                focusNode.requestFocus();
                
              },
              onTapOutside: (_) {
                focusNode.unfocus();
              },
              onEditingComplete: () {
                focusNode.unfocus();
              }),
        ),
        Visibility(
          visible: widget.helper.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.helper,
              textAlign: TextAlign.start,
              style: TextStyle(
                  //  fontFamily: CustomTheme.of(context).bodySmallFamily,
                  letterSpacing: 0,
                  fontSize: 14.0,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}