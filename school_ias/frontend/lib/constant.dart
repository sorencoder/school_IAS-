import 'package:flutter/material.dart';

class AppColors {
  static Color appbarColor = const Color(0xFF153448);
  static Color textColor = const Color(0xffF6F5F2);
  static Color panelColor = const Color(0xffA6B37D);
  static Color darkMode = const Color(0xff3C3D37);
  static Color boardColor = const Color(0xff86AB89);
  static Color scafoldColor = const Color(0xff697565);
}

class Themes {
  static ThemeData defaultTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.scafoldColor,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.appbarColor,
          iconTheme: IconThemeData(color: AppColors.textColor),
          titleTextStyle: const TextStyle(fontFamily: 'Ubuntu', fontSize: 25)));
}
