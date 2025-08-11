import 'package:decor_nest/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/core/themes/app_styles.dart';

class SignUpOption extends StatelessWidget {
  const SignUpOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have an account? ',
          style: AppStyles.regular14(context),
          children: [
            TextSpan(
              text: 'Sign Up',
              style: AppStyles.medium14(
                context,
              ).copyWith(color: context.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
