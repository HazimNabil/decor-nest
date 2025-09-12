import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorite_card.dart';
import 'package:flutter/material.dart';

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
      itemBuilder: (_, _) => FavoriteCard(product: Product.dummy()),
    );
  }
}
