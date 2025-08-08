import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 40,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, fit: BoxFit.scaleDown),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52),
          child: Text(
            description,
            style: AppStyles.medium24(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
