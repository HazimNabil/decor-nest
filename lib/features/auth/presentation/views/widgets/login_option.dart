import 'package:decor_nest/core/helper/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:go_router/go_router.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: AppStyles.regular14(context),
          children: [
            TextSpan(
              text: 'Login',
              style: AppStyles.medium14(
                context,
              ).copyWith(color: context.primaryColor),
              recognizer: TapGestureRecognizer()..onTap = () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
