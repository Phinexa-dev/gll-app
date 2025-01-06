import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: PhinexaColor.primaryColor,
      onPrimary: PhinexaColor.black,
      secondary: Colors.blueAccent,
      onSecondary: PhinexaColor.black,
      onSurface: PhinexaColor.black,

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
