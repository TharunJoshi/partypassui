import 'package:flutter/material.dart';

class AppTheme {
  // Define primary and secondary colors
  static const Color primaryColor = Color(0xFF1A73E8); // Blue
  static const Color secondaryColor = Color(0xFF185ABC); // Darker Blue
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light Gray
  static const Color textColor = Color(0xFF333333); // Dark Gray

  // Define text styles
  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: textColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Define button style
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: primaryColor,
    onPrimary: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    textStyle: buttonText,
  );

  // Create the app's theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      headline1: headline1,
      bodyText1: bodyText1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
  );
}
