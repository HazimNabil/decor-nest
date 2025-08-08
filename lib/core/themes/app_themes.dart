import 'package:flutter/material.dart';

class AppThemes {
  static final light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Switzer',
    scaffoldBackgroundColor: const Color(0xFFF9F9F9),
    hintColor: const Color(0xFF828A89),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0C8A7B),
      secondary: Color(0xFF101817),
      tertiary: Color(0xFFF2A666),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Switzer',
    scaffoldBackgroundColor: const Color(0xFF090C0B),
    hintColor: const Color(0xFF828A89),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF0C8A7B),
      secondary: Colors.white,
      tertiary: Color(0xFFF2A666),
      surface: Color(0xFF1B201E),
    ),
  );
}
