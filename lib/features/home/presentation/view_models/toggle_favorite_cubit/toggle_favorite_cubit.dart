import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_favorite_state.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  final FavoritesRepo favoritesRepo;

  ToggleFavoriteCubit(this.favoritesRepo)
    : super(const ToggleFavoriteInitial());

  Future<void> toggleFavorite({
    required FavoriteProduct favorite,
    required bool isFavorite,
  }) async {
    emit(ToggleFavoriteSuccess(isFavorite));

    final result = await favoritesRepo.toggleFavorite(
      favorite: favorite,
      isFavorite: isFavorite,
    );
    result.fold(
      (failure) => emit(ToggleFavoriteFailure(failure.message)),
      (_) => {},
    );
  }
}
