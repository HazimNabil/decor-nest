import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:flutter/material.dart';

class SortByDropDown extends StatelessWidget {
  final ProductFilter filter;

  const SortByDropDown({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sort By', style: AppStyles.medium20(context)),
        CustomDropDownButton(
          values: _sortByOptions.keys.toList(),
          currentValue: 'Newest',
          onChanged: _selectSortByOption,
        ),
      ],
    );
  }

  void _selectSortByOption(String value) {
    filter.sortBy = _sortByOptions[value]!;
    filter.ascending = value == 'Oldest' || value == 'Price: Low to High';
  }

  Map<String, String> get _sortByOptions {
    return const {
      'Newest': TableConstants.createdAt,
      'Oldest': TableConstants.createdAt,
      'Price: Low to High': TableConstants.price,
      'Price: High to Low': TableConstants.price,
    };
  }
}
