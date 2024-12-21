import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.black,
      secondary: Colors.blueAccent,
      onSecondary: Colors.black,
      onSurface: Colors.black,

    ),
    // Add more theme properties as needed.
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primary: Colors.deepOrange[900]!,
      onPrimary: Colors.white,
      secondary: Colors.cyan[700]!,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
  );
}
