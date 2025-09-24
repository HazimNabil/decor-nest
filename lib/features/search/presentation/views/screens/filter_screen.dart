import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/category_filter_chips.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const path = '/filter';

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Filter'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 24), CategoryFilterChips()],
        ),
      ),
    );
  }
}
