import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorite_card.dart';
import 'package:flutter/material.dart';

class FavoriteCardGridView extends StatelessWidget {
  final List<FavoriteProduct> favorites;

  const FavoriteCardGridView({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.71,
      ),
      itemCount: favorites.length,
      itemBuilder: (_, index) {
        return FavoriteCard(
          key: ValueKey(favorites[index].id),
          favorite: favorites[index],
        );
      },
    );
  }
}
