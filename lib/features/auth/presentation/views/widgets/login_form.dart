import 'package:decor_nest/core/helper/extensions.dart';
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
          CustomTextField(
            hint: 'Enter your email',
            validator: (input) => input.validateEmail(),
            onSaved: (email) => loginInputData.email = email!,
          ),
          const SizedBox(height: 16),
          Text('Password', style: AppStyles.medium14(context)),
          const SizedBox(height: 8),
          CustomTextField(
            hint: 'Enter your password',
            isPassword: true,
            validator: (input) => input.validateRequired('password'),
            onSaved: (password) => loginInputData.password = password!,
          ),
        ],
      ),
    );
  }
}
