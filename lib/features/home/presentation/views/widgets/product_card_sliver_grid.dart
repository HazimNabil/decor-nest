import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/home/presentation/view_models/toggle_favorite_cubit/toggle_favorite_cubit.dart';

class ProductCardSliverGrid extends StatelessWidget {
  final List<Product> products;

  const ProductCardSliverGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.71,
      ),
      itemCount: products.length,
      itemBuilder: (_, index) {
        return BlocProvider(
          create: (context) =>
              ToggleFavoriteCubit(locator<FavoritesRepoImpl>()),
          child: ProductCard(product: products[index]),
        );
      },
    );
  }
}
