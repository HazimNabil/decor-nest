import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get textColor => Theme.of(this).colorScheme.secondary;
  Color get actionColor => Theme.of(this).colorScheme.tertiary;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get subTextColor => Theme.of(this).hintColor;
}

extension MediaQueryExtension on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get scaleFactor => screenWidth / 375;
}