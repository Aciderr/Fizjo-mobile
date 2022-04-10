import 'package:flutter/material.dart';

const apiUrl = 'https://h9u3co8m81.execute-api.eu-central-1.amazonaws.com/prod/';

const MaterialColor themeColor = MaterialColor(
  0xFF212121,
  <int, Color>{
    50: Color(0xFF212121),
    100: Color(0xFF212121),
    200: Color(0xFF212121),
    300: Color(0xFF212121),
    350: Color(0xFF212121), // only for raised button while pressed in light theme
    400: Color(0xFF212121),
    500: Color(0xFF212121),
    600: Color(0xFF212121),
    700: Color(0xFF212121),
    800: Color(0xFF212121),
    850: Color(0xFF212121), // only for background color in dark theme
    900: Color(0xFF212121),
  },
);

class AppColors {
  static Color? success = Colors.green[500];
  static Color? successBright = Colors.green[100];
  static Color? black = const Color.fromRGBO(51, 50, 50, 1);
}