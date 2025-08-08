import 'package:decor_nest/features/onboarding/presentation/views/widgets/dot.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Dot(isSelected: false),
        Dot(isSelected: true),
        Dot(isSelected: false),
      ],
    );
  }
}
