import 'package:decor_nest/features/home/presentation/views/widgets/category_chip.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryChip(label: 'Chair', selected: true);
  }
}
