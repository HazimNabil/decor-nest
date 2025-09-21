import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_card_sliver_grid.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/search_header.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SearchHeader()),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ProductCardSliverGrid(products: List.filled(12, Product.dummy())),
            ],
          ),
        ),
      ),
    );
  }
}
