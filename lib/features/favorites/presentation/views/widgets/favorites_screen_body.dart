import 'package:decor_nest/core/widgets/failure_indicator.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorite_card_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/favorites/presentation/view_models/favorites_cubit/favorites_cubit.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 6),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return switch (state) {
            FavoritesLoadInProgress() => const Center(
              child: CircularProgressIndicator(),
            ),
            FavoritesLoaded(:final favorites) => FavoriteCardGridView(
              favorites: favorites,
            ),
            FavoritesLoadFailure(:final message) => Center(
              child: FailureIndicator(message: message),
            ),
            _ => const Center(child: SizedBox.shrink()),
          };
        },
      ),
    );
  }
}
