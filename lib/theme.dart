import 'package:flutter/material.dart';

final ThemeData customLightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFF7D2FF),
  primaryColor: Color(0xFFC0D7FF),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFBEC1FF),
    foregroundColor: Colors.black,
  ),
  cardColor: Color(0xFFC8B3FF),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFC3F9FF),
  ),
  colorScheme: ColorScheme.light(
    primary: Color(0xFFC0D7FF),
    secondary: Color(0xFFC8B3FF),
  ),
);
