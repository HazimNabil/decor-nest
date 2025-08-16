import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/auth/data/models/login_input_data.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final LoginInputData loginInputData;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.loginInputData,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email', style: AppStyles.medium14(context)),
          const SizedBox(height: 8),
          CustomTextField(hint: 'Enter your email', validator: _emailValidator),
          const SizedBox(height: 16),
          Text('Password', style: AppStyles.medium14(context)),
          const SizedBox(height: 8),
          CustomTextField(
            hint: 'Enter your password',
            isPassword: true,
            validator: _passwordValidator,
          ),
        ],
      ),
    );
  }

  String? _emailValidator(String? email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (email?.isEmpty ?? true) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(email!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? password) {
    if (password?.isEmpty ?? true) {
      return 'Please enter your password';
    }
    return null;
  }
}
