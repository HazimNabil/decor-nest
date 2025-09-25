import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:flutter/material.dart';

class CategoryFilterChips extends StatefulWidget {
  final ProductFilter filter;

  const CategoryFilterChips({super.key, required this.filter});

  @override
  State<CategoryFilterChips> createState() => _CategoryFilterChipsState();
}

class _CategoryFilterChipsState extends State<CategoryFilterChips> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: AppStyles.medium20(context)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 4,
          children: List.generate(_categories.length, (index) {
            return FilterChip(
              label: Text(_categories[index]),
              labelStyle: AppStyles.regular14(context).copyWith(
                color: widget.filter.categories.contains(_categories[index])
                    ? Colors.white
                    : context.subTextColor,
              ),
              selectedColor: context.primaryColor,
              checkmarkColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              selected: widget.filter.categories.contains(_categories[index]),
              onSelected: (selected) => _selectCategories(selected, index),
            );
          }),
        ),
      ],
    );
  }

  void _selectCategories(bool selected, int index) {
    setState(() {
      if (selected) {
        widget.filter.categories.add(_categories[index]);
      } else {
        widget.filter.categories.remove(_categories[index]);
      }
    });
  }

  List<String> get _categories {
    return const ['chair', 'table', 'lamp', 'sofa', 'mirror', 'mattress'];
  }
}
