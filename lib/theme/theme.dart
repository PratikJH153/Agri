import 'package:flutter/material.dart';

class MyColors {
  static const Color primaryColor = Color(0xFFFFFFFF); // #181818 dark grey
  static const Color secondaryColor = Color(0xFFE6FF46); // #E6FF46 light yellow
  static const Color accentColor = Color(0xFFC7DD36); // #C7DD36 light green
  static const Color backgroundColor = Color(0xFF181818); // #FFFFFF white
  static const Color backgroundColorLight = Color(0xFFF2F6FF);
  static const Color backgroundColorDark = Color(0xFF25254B);
  static const Color shadowColorLight = Color(0xFF4A5367);
  static const Color shadowColorDark = Colors.black;
  static const Color textColor = Color(0xFFF25C54); // #F25C54 coral
  static const Color buttonColor = Color(0xFF6A4C93); // #6A4C93 purple
  static const Color highlightColor = Color(0xFFF7A4A4); // #F7A4A4 light coral
}

final ThemeData themeData = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF0f0e0f),
  primaryColor: MyColors.accentColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),
  brightness: Brightness.dark,
  fontFamily: "Roboto",
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
