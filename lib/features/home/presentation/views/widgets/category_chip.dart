import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;

  const CategoryChip({super.key, required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      labelStyle: AppStyles.regular14(
        context,
      ).copyWith(color: selected ? Colors.white : context.subTextColor),
      selectedColor: context.primaryColor,
      disabledColor: context.surfaceColor,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      showCheckmark: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      selected: selected,
      onSelected: (value) {},
    );
  }
}
