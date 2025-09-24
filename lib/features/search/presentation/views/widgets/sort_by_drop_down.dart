import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';

class SortByDropDown extends StatelessWidget {
  const SortByDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sort By', style: AppStyles.medium20(context)),
        CustomDropDownButton(
          values: _sortByOptions,
          currentValue: 'Newest',
          onChanged: (value) {},
        ),
      ],
    );
  }

  List<String> get _sortByOptions {
    return const [
      'Newest',
      'Oldest',
      'Price: Low to High',
      'Price: High to Low',
    ];
  }
}
