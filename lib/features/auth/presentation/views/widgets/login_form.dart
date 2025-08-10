import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email', style: AppStyles.medium14(context)),
        const SizedBox(height: 8),
        const CustomTextField(hint: 'Enter your email'),
        const SizedBox(height: 16),
        Text('Password', style: AppStyles.medium14(context)),
        const SizedBox(height: 8),
        const CustomTextField(hint: 'Enter your password', isPassword: true),
      ],
    );
  }
}
