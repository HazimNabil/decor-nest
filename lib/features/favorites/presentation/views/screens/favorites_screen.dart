import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorite_card.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: FavoriteCard(product: Product.dummy())),
    );
  }
}
