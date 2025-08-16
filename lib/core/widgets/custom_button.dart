import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String? icon;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    required this.color,
    this.textColor = Colors.white,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        icon: icon != null && !isLoading ? SvgPicture.asset(icon!) : null,
        label: handleLoading(context),
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: color,
          iconColor: textColor,
          iconAlignment: IconAlignment.start,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
      ),
    );
  }

  Widget handleLoading(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
      );
    }
    return Text(
      text,
      style: AppStyles.semiBold16(context).copyWith(color: textColor),
    );
  }
}
