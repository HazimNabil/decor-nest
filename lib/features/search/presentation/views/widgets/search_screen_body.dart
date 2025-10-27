import 'package:decor_nest/features/search/presentation/views/widgets/search_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/failure_indicator.dart';
import 'package:decor_nest/core/widgets/product_card_sliver_grid.dart';
import 'package:decor_nest/core/widgets/empty_state_widget.dart';
import 'package:decor_nest/features/search/presentation/view_models/search_bloc/search_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreenBody extends StatelessWidget {
  final ScrollController scrollController;

  const SearchScreenBody({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverToBoxAdapter(child: SearchHeader()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return switch (state.status) {
                SearchStatus.initial => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptyStateWidget(
                    image: Assets.imagesTypeToSearch,
                    message: 'Start typing to search for products',
                  ),
                ),
                SearchStatus.loading => Skeletonizer.sliver(
                  child: ProductCardSliverGrid(
                    products: List.filled(12, Product.dummy()),
                  ),
                ),
                SearchStatus.success =>
                  state.products.isEmpty
                      ? const SliverFillRemaining(
                          hasScrollBody: false,
                          child: EmptyStateWidget(
                            image: Assets.imagesNoResultsFound,
                            message: 'No search results found',
                          ),
                        )
                      : ProductCardSliverGrid(products: state.products),
                SearchStatus.failure => SliverFillRemaining(
                  hasScrollBody: false,
                  child: FailureIndicator(message: state.errorMessage!),
                ),
              };
            },
          ),
        ],
      ),
    );
  }
}
