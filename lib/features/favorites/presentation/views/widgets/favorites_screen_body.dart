import 'package:decor_nest/features/favorites/presentation/views/widgets/favorite_card_grid_view.dart';
import 'package:flutter/material.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 6),
      child: FavoriteCardGridView(),
    );
  }
}
