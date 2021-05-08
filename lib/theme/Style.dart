import 'package:flutter/material.dart';

import 'dart:ui';

ThemeData appTheme() => ThemeData(
      backgroundColor: HexColor('#E2EDF8'),
      primaryColor: HexColor('#E2EDF8'),
      accentColor: Colors.blue,
      cursorColor: Colors.blue,
      scaffoldBackgroundColor: HexColor('#E2EDF8'),
    );

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
