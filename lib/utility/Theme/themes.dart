import 'package:flutter/material.dart';

class Apptheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Medium',
      colorScheme: ColorScheme.light(
        primary: Colors.purple,
        secondary: Colors.lightBlue.shade400,
      ));
  static ThemeData DarkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Medium',
      colorScheme: ColorScheme.light(
        primary: Colors.deepPurple,
        secondary: Colors.blue.shade400,
        brightness: Brightness.dark,
      ));
}
