import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorite_card.dart';
import 'package:decor_nest/features/home/presentation/view_models/toggle_favorite_cubit/toggle_favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCardGridView extends StatelessWidget {
  const FavoriteCardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.71,
      ),
      itemCount: 10,
      itemBuilder: (_, _) {
        return BlocProvider(
          create: (context) =>
              ToggleFavoriteCubit(locator<FavoritesRepoImpl>()),
          child: FavoriteCard(
            product: FavoriteProduct.fromProduct(Product.dummy(), 'userId'),
          ),
        );
      },
    );
  }
}
