import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryFilterChips extends StatefulWidget {
  const CategoryFilterChips({super.key});

  @override
  State<CategoryFilterChips> createState() => _CategoryFilterChipsState();
}

class _CategoryFilterChipsState extends State<CategoryFilterChips> {
  final _selectedCategories = <String>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
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
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedCategories.add(_categories[index]);
                  } else {
                    _selectedCategories.remove(_categories[index]);
                  }
                });
              },
            );
          }),
        ),
      ],
    );
  }

  List<String> get _categories {
    return const ['chair', 'table', 'lamp', 'sofa', 'mirror', 'mattress'];
  }
}
