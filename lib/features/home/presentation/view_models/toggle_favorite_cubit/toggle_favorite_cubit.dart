import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_favorite_state.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  final FavoritesRepo favoritesRepo;

  ToggleFavoriteCubit(this.favoritesRepo)
    : super(const ToggleFavoriteInitial());

  Future<void> toggleFavorite({
    required FavoriteProduct favorite,
    required bool isFavorite,
  }) async {
    final result = await favoritesRepo.toggleFavorite(
      favorite: favorite,
      isFavorite: isFavorite,
    );
    result.fold(
      (failure) => emit(ToggleFavoriteFailure(failure.message)),
      (_) => emit(const ToggleFavoriteSuccess()),
    );
  }
}
