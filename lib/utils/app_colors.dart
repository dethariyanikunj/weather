import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor primaryPalette = MaterialColor(
    primary.value,
    <int, Color>{
      50: primary.withAlpha(10),
      100: primary.withAlpha(20),
      200: primary.withAlpha(30),
      300: primary.withAlpha(40),
      400: primary.withAlpha(50),
      500: primary.withAlpha(60),
      600: primary.withAlpha(70),
      700: primary.withAlpha(80),
      800: primary.withAlpha(90),
      900: primary.withAlpha(100),
    },
  );

  static const Color primary = Color(0xff007CC3);
  static const Color colorWhite = Colors.white;
  static const Color colorBlack = Colors.black;
  static const Color colorTransparent = Colors.transparent;
  static const Color colorSunny = Color(0xffFFD700);
  static const Color colorCloudy = Color(0xffA9A9A9);
  static const Color colorRainy = Color(0xff4682B4);
  static const Color colorSnowy = Color(0xffE0F7FA);
  static const Color colorUnknown = Color(0xff808080);
}
