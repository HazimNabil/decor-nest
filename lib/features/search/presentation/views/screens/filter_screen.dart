import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/category_filter_chips.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/price_range_slider.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/wood_type_filter_chips.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const path = '/filter';

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Filter'),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          spacing: 32,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryFilterChips(),
            WoodTypeFilterChips(),
            PriceRangeSlider(),
          ],
        ),
      ),
    );
  }
}
