import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:decor_nest/core/themes/app_styles.dart';

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
  double get heightRatio => screenHeight / 812;
  double get widthRatio => screenWidth / 375;
}

extension ToastExtension on BuildContext {
  void showToast({required String message, required ToastificationType type}) {
    toastification.show(
      context: this,
      title: Text(
        message,
        style: AppStyles.semiBold16(this).copyWith(color: Colors.white),
      ),
      type: type,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
    );
  }
}
