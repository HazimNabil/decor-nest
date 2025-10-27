import 'package:decor_nest/features/onboarding/presentation/views/widgets/dot.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;

  const DotIndicator({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: List.generate(
        3,
        (index) => Dot(isSelected: index == currentIndex),
      ),
    );
  }
}
