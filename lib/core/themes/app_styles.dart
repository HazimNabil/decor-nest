import 'package:decor_nest/core/helper/extensions.dart';
import 'package:flutter/widgets.dart';

class AppStyles {
  static TextStyle medium12(BuildContext context) {
    return TextStyle(
      fontSize: 12 * context.widthRatio,
      fontWeight: FontWeight.w500,
      color: context.subTextColor,
    );
  }

  static TextStyle regular13(BuildContext context) {
    return TextStyle(
      fontSize: 13 * context.widthRatio,
      fontWeight: FontWeight.w400,
      color: context.subTextColor,
    );
  }

  static TextStyle regular14(BuildContext context) {
    return TextStyle(
      fontSize: 14 * context.widthRatio,
      fontWeight: FontWeight.w400,
      color: context.subTextColor,
    );
  }

  static TextStyle medium14(BuildContext context) {
    return TextStyle(
      fontSize: 14 * context.widthRatio,
      fontWeight: FontWeight.w500,
      color: context.textColor,
    );
  }

  static TextStyle regular16(BuildContext context) {
    return TextStyle(
      fontSize: 16 * context.widthRatio,
      fontWeight: FontWeight.w400,
      color: context.subTextColor,
    );
  }

  static TextStyle medium16(BuildContext context) {
    return TextStyle(
      fontSize: 16 * context.widthRatio,
      fontWeight: FontWeight.w500,
      color: context.textColor,
    );
  }

  static TextStyle semiBold16(BuildContext context) {
    return TextStyle(
      fontSize: 16 * context.widthRatio,
      fontWeight: FontWeight.w600,
      color: context.surfaceColor,
    );
  }

  static TextStyle medium20(BuildContext context) {
    return TextStyle(
      fontSize: 20 * context.widthRatio,
      fontWeight: FontWeight.w500,
      color: context.textColor,
    );
  }

  static TextStyle medium24(BuildContext context) {
    return TextStyle(
      fontSize: 24 * context.widthRatio,
      fontWeight: FontWeight.w500,
      color: context.textColor,
    );
  }

  static TextStyle semiBold32(BuildContext context) {
    return TextStyle(
      fontSize: 32 * context.widthRatio,
      fontWeight: FontWeight.w600,
      color: context.textColor,
    );
  }
}
