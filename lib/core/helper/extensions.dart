import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:decor_nest/core/themes/app_styles.dart';

extension ThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
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
      autoCloseDuration: const Duration(seconds: 4),
      animationDuration: const Duration(milliseconds: 500),
    );
  }
}

extension ValidationExtension on String? {
  String? validateEmail() {
    if (this?.isEmpty ?? true) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(this!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword() {
    if (this?.isEmpty ?? true) {
      return 'Please enter your password';
    } else if (this!.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? password) {
    if (this?.isEmpty ?? true) {
      return 'Please enter your confirm password';
    } else if (this != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateRequired(String fieldName) {
    if (this?.isEmpty ?? true) {
      return 'Please enter your $fieldName';
    }
    return null;
  }
}

extension DateFormatExtension on DateTime {
  String get formatted => '$day-$month-$year';
}
