import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorite_card.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorites_screen_app_bar.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FavoritesScreenAppBar(),
      body: FavoriteCard(product: Product.dummy()),
    );
  }
}
