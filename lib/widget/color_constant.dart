import 'package:flutter/material.dart';

class ColorConstant{


   static Color splash = fromHex('#000000');

   static Color whiteScreen = fromHex('#ffffff');

   static Color faintColor = fromHex('#737373');

   static Color buttonColor = fromHex('#523AE4');

   static Color button = fromHex('#c8c0f6');

   static Color blackColor = fromHex('#171717');

   static Color blottColor = fromHex('#1E1F20');

   static Color buttonTextColor = fromHex('#FAFAFA');

   static Color userColor = fromHex('#A3A3A3');

   static Color dialogColor = fromHex('#007AFF');

   static Color appbarColor = fromHex('#05021B');

   static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

}