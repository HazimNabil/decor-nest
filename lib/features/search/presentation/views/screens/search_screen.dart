import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/failure_indicator.dart';
import 'package:decor_nest/core/widgets/product_card_sliver_grid.dart';
import 'package:decor_nest/features/search/presentation/views/widgets/search_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/search/presentation/view_models/search_bloc/search_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final currentPosition = _scrollController.position.pixels;
    final maxPosition = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxPosition * 0.7) {
      context.read<SearchBloc>().add(const ProductsMoreSearched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverToBoxAdapter(child: SearchHeader()),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return switch (state.status) {
                    SearchStatus.initial => const SliverToBoxAdapter(
                      child: Center(child: Text('Type something to search')),
                    ),
                    SearchStatus.loading => Skeletonizer.sliver(
                      child: ProductCardSliverGrid(
                        products: List.filled(12, Product.dummy()),
                      ),
                    ),
                    SearchStatus.success => ProductCardSliverGrid(
                      products: state.products,
                    ),
                    SearchStatus.failure => SliverToBoxAdapter(
                      child: FailureIndicator(message: state.errorMessage!),
                    ),
                  };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
