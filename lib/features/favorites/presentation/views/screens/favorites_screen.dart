import 'package:decor_nest/features/favorites/presentation/views/widgets/favorite_card_grid_view.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorites_screen_app_bar.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FavoritesScreenAppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 6),
        child: FavoriteCardGridView(),
      ),
    );
  }
}
