import 'package:flutter/material.dart';
import 'package:decor_nest/core/themes/app_styles.dart';

class LabeledField extends StatelessWidget {
  final String label;
  final Widget widget;

  const LabeledField({super.key, required this.label, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.medium14(context)),
        const SizedBox(height: 8),
        widget,
      ],
    );
  }
}
