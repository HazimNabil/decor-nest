import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/forgot_password_option.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/login_form.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/sign_up_option.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const path = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: AppStyles.semiBold32(context)),
                const SizedBox(height: 8),
                Text(
                  'Welcome Back! Please Enter Your Details.',
                  style: AppStyles.regular16(context),
                ),
                const SizedBox(height: 48),
                const LoginForm(),
                const SizedBox(height: 16),
                const ForgotPasswordOption(),
                const SizedBox(height: 48),
                CustomButton(
                  text: 'Sign In',
                  color: context.primaryColor,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Sign In With Google',
                  color: context.surfaceColor,
                  textColor: context.textColor,
                  onPressed: () {},
                ),
                const SizedBox(height: 24),
                const SignUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
