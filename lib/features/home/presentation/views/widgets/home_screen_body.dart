import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/failure_indicator.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/category_chip_list_view.dart';
import 'package:decor_nest/core/widgets/product_card_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/home/presentation/view_models/fetch_products_bloc/fetch_products_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreenBody extends StatelessWidget {
  final ScrollController controller;

  const HomeScreenBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        controller: controller,
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          const SliverToBoxAdapter(child: CategoryChipListView()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          BlocBuilder<FetchProductsBloc, FetchProductsState>(
            builder: (context, state) {
              return switch (state.status) {
                FetchProductsStatus.loading => Skeletonizer.sliver(
                  child: ProductCardSliverGrid(
                    products: List.filled(20, Product.dummy()),
                  ),
                ),
                FetchProductsStatus.success => ProductCardSliverGrid(
                  products: state.products,
                ),
                FetchProductsStatus.failure => SliverFillRemaining(
                  hasScrollBody: false,
                  child: FailureIndicator(message: state.errorMessage!),
                ),
                _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
              };
            },
          ),
        ],
      ),
    );
  }
}
