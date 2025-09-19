import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_status_state.dart';

class FavoriteStatusCubit extends Cubit<FavoriteStatusState> {
  final FavoritesRepo favoritesRepo;

  FavoriteStatusCubit(this.favoritesRepo) : super(const FavoriteStatusState());

  Future<void> toggleFavorite(Product product) async {
    emit(
      state.copyWith(
        status: FavoriteStatus.success,
        isFavorite: !state.isFavorite,
      ),
    );

    final result = await favoritesRepo.toggleFavorite(product);
    result.fold((failure) {
      emit(
        state.copyWith(
          status: FavoriteStatus.failure,
          isFavorite: !state.isFavorite,
          errorMessage: failure.message,
        ),
      );
    }, (_) {});
  }

  Future<void> initFavoriteStatus(Product product) async {
    emit(state.copyWith(status: FavoriteStatus.loading));

    final isFavorite = await favoritesRepo.isFavorite(product);
    emit(
      state.copyWith(status: FavoriteStatus.success, isFavorite: isFavorite),
    );
  }
}
