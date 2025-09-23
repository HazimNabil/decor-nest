import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const path = '/filter';

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Filter'),
      body: Center(child: Text('Filter')),
    );
  }
}
