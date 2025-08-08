import 'package:decor_nest/core/helper/extensions.dart';
import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final bool isSelected;

  const Dot({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isSelected ? 1 : 0.3,
      duration: const Duration(milliseconds: 500),
      child: CircleAvatar(radius: 6, backgroundColor: context.primaryColor),
    );
  }
}
