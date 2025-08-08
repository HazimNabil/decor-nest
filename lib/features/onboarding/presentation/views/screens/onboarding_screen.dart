import 'package:decor_nest/features/onboarding/presentation/views/widgets/dot_indicator.dart';
import 'package:decor_nest/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  static const path = '/';

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [OnboardingPageView(), DotIndicator()],
        ),
      ),
    );
  }
}
