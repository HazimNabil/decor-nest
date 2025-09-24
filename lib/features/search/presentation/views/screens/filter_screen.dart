import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/category_filter_chips.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/price_range_slider.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/sort_by_drop_down.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/wood_type_filter_chips.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const path = '/filter';

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Filter'),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategoryFilterChips(),
              const WoodTypeFilterChips(),
              const PriceRangeSlider(),
              const SortByDropDown(),
              CustomButton(
                text: 'Apply Filters',
                color: context.primaryColor,
                onPressed: () {},
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
