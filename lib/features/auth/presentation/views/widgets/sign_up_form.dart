import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final SignUpInputData signUpInputData;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.signUpInputData,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name', style: AppStyles.medium14(context)),
          const SizedBox(height: 8),
          CustomTextField(
            hint: 'Enter your name',
            validator: _nameValidator,
            onSaved: (username) => signUpInputData.username = username!,
          ),
          const SizedBox(height: 16),
          Text('Email', style: AppStyles.medium14(context)),
          const SizedBox(height: 8),
          CustomTextField(
            hint: 'Enter your email',
            validator: _emailValidator,
            onSaved: (email) => signUpInputData.email = email!,
          ),
          const SizedBox(height: 16),
          Text('Password', style: AppStyles.medium14(context)),
          const SizedBox(height: 8),
          CustomTextField(
            hint: 'Enter your password',
            isPassword: true,
            validator: _passwordValidator,
            onChanged: (password) => signUpInputData.password = password,
          ),
          const SizedBox(height: 16),
          Text('Confirm Password', style: AppStyles.medium14(context)),
          const SizedBox(height: 8),
          CustomTextField(
            hint: 'Confirm your password',
            isPassword: true,
            validator: _confirmPasswordValidator,
          ),
        ],
      ),
    );
  }

  String? _nameValidator(String? name) {
    if (name?.isEmpty ?? true) {
      return 'Please enter your name';
    }
    return null;
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
    } else if (password!.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? confirmPassword) {
    if (confirmPassword?.isEmpty ?? true) {
      return 'Please enter your confirm password';
    } else if (confirmPassword != signUpInputData.password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
