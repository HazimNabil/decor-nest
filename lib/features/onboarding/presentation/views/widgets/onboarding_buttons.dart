import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text('Skip', style: AppStyles.regular16(context)),
        ),
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: const Size(56, 56),
          ),
          child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        ),
      ],
    );
  }
}