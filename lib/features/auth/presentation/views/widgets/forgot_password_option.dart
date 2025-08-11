import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordOption extends StatelessWidget {
  const ForgotPasswordOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Text('Forgot Password?', style: AppStyles.medium14(context)),
      ),
    );
  }
}
