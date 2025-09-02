import 'package:decor_nest/features/home/presentation/views/widgets/category_chip_list_view.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(child: CategoryChipListView()),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(child: ProductCard()),
      ],
    );
  }
}
