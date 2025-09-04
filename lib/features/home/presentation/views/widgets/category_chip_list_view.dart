import 'package:decor_nest/features/home/presentation/view_models/fetch_products_bloc/fetch_products_bloc.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/category_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryChipListView extends StatefulWidget {
  const CategoryChipListView({super.key});

  @override
  State<CategoryChipListView> createState() => _CategoryChipListViewState();
}

class _CategoryChipListViewState extends State<CategoryChipListView> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return CategoryChip(
            category: categories[index],
            selected: _selectedIndex == index,
            onSelected: (selected) {
              setState(() => _selectedIndex = selected ? index : -1);
              context.read<FetchProductsBloc>().add(
                ProductsFetched(category: categories[_selectedIndex]),
              );
            },
          );
        },
        separatorBuilder: (_, _) {
          return const SizedBox(width: 12);
        },
      ),
    );
  }

  List<String> get categories {
    return const ['chair', 'table', 'lamp', 'sofa', 'mirror', 'mattress'];
  }
}
