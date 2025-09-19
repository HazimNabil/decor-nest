import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_favorite_state.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  final FavoritesRepo favoritesRepo;

  ToggleFavoriteCubit(this.favoritesRepo) : super(const ToggleFavoriteState());

  Future<void> toggleFavorite(Product product) async {
    emit(
      state.copyWith(
        status: ToggleFavoriteStatus.success,
        isFavorite: !state.isFavorite,
      ),
    );

    final result = await favoritesRepo.toggleFavorite(product);
    result.fold((failure) {
      emit(
        state.copyWith(
          status: ToggleFavoriteStatus.failure,
          isFavorite: !state.isFavorite,
          errorMessage: failure.message,
        ),
      );
    }, (_) {});
  }

  Future<void> initFavoriteStatus(Product product) async {
    emit(state.copyWith(status: ToggleFavoriteStatus.loading));

    final isFavorite = await favoritesRepo.isFavorite(product);
    emit(
      state.copyWith(
        status: ToggleFavoriteStatus.success,
        isFavorite: isFavorite,
      ),
    );
  }
}
