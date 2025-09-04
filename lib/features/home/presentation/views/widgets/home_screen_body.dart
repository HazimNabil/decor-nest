import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/failure_indicator.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/category_chip_list_view.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_card_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/home/presentation/view_models/fetch_products_bloc/fetch_products_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final currentPosition = _scrollController.position.pixels;
    final maxPosition = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxPosition * 0.6) {
      context.read<FetchProductsBloc>().add(const ProductsMoreFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        controller: _scrollController,
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
