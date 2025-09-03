import 'package:decor_nest/features/home/presentation/views/widgets/category_chip_list_view.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_card_sliver_grid.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: CategoryChipListView()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          ProductCardSliverGrid(),
        ],
      ),
    );
  }
}
