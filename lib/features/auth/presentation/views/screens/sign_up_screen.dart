import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const path = '/sign_up';

  const SignUpScreen({super.key});

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
                Text('Create Account', style: AppStyles.semiBold32(context)),
                const SizedBox(height: 8),
                Text(
                  'Let\'s create account together',
                  style: AppStyles.regular16(context),
                ),
                const SizedBox(height: 32),
                const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
