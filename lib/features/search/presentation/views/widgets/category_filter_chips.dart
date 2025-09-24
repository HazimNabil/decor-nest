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
  final _selectedCategories = <String>[];

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
                color: _selectedCategories.contains(_categories[index])
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
              selected: _selectedCategories.contains(_categories[index]),
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
        _selectedCategories.add(_categories[index]);
      } else {
        _selectedCategories.remove(_categories[index]);
      }
    });
    widget.filter.categories = _selectedCategories;
  }

  List<String> get _categories {
    return const ['chair', 'table', 'lamp', 'sofa', 'mirror', 'mattress'];
  }
}
