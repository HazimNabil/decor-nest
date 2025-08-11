import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const path = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: AppStyles.semiBold32(context)),
                const SizedBox(height: 8),
                Text(
                  'Welcome Back! Please Enter Your Details.',
                  style: AppStyles.regular16(context),
                ),
                const SizedBox(height: 32),
                const LoginForm(),
                const SizedBox(height: 16),
                GestureDetector(
                  child: Text(
                    'Forgot Password?',
                    style: AppStyles.regular14(context),
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(text: 'Login', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
