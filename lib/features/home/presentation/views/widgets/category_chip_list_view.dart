import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/services/reference_data_service.dart';
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
  final _categories = locator<ReferenceDataService>().categories;
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        itemCount: _categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return CategoryChip(
            category: _categories[index],
            selected: _selectedIndex == index,
            onSelected: (selected) {
              setState(() => _selectedIndex = selected ? index : -1);
              context.read<FetchProductsBloc>().add(
                ProductsFetched(
                  category: selected ? _categories[_selectedIndex] : null,
                ),
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
}
