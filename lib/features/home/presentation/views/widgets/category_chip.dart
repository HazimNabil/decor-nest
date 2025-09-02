import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String category;
  final bool selected;
  final void Function(bool) onSelected;

  const CategoryChip({
    super.key,
    required this.category,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(category),
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
      onSelected: onSelected,
    );
  }
}
