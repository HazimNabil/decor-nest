import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingButtons extends StatelessWidget {
  final PageController pageController;

  const OnboardingButtons({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: Text('Skip', style: AppStyles.regular16(context)),
        ),
        FilledButton(
          onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
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
