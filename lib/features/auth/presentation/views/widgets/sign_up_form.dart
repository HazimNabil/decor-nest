import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name', style: AppStyles.medium14(context)),
        const SizedBox(height: 8),
        const CustomTextField(hint: 'Enter your name'),
        const SizedBox(height: 16),
        Text('Email', style: AppStyles.medium14(context)),
        const SizedBox(height: 8),
        const CustomTextField(hint: 'Enter your email'),
        const SizedBox(height: 16),
        Text('Password', style: AppStyles.medium14(context)),
        const SizedBox(height: 8),
        const CustomTextField(hint: 'Enter your password', isPassword: true),
        const SizedBox(height: 16),
        Text('Confirm Password', style: AppStyles.medium14(context)),
        const SizedBox(height: 8),
        const CustomTextField(hint: 'Confirm your password', isPassword: true),
      ],
    );
  }
}
