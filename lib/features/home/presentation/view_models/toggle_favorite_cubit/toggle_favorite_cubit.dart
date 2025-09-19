import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_favorite_state.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  final FavoritesRepo favoritesRepo;

  ToggleFavoriteCubit(this.favoritesRepo)
    : super(const ToggleFavoriteInitial());

  Future<void> toggleFavorite(Product product) async {
    final previousState = state;
    if (previousState is ToggleFavoriteSuccess) {
      emit(ToggleFavoriteSuccess(!previousState.isFavorite));
    }

    final result = await favoritesRepo.toggleFavorite(product);
    result.fold((failure) {
      emit(previousState);
      emit(ToggleFavoriteFailure(failure.message));
    }, (_) {});
  }

  Future<void> initFavoriteStatus(Product product) async {
    emit(const ToggleFavoriteLoading());

    final isFavorite = await favoritesRepo.isFavorite(product);
    emit(ToggleFavoriteSuccess(isFavorite));
  }
}
