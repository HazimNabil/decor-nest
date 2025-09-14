import 'dart:async';

import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _favoritesRepo;
  late final StreamSubscription _favoritesSubscription;

  FavoritesCubit(this._favoritesRepo) : super(FavoritesInitial()) {
    _listenToFavorites();
  }

  void _listenToFavorites() {
    emit(FavoritesLoadInProgress());

    final favoritesStream = _favoritesRepo.watchFavorites();

    _favoritesSubscription = favoritesStream.listen((result) {
      result.fold(
        (failure) => emit(FavoritesLoadFailure(failure.message)),
        (favorites) => emit(FavoritesLoaded(favorites)),
      );
    });
  }

  @override
  Future<void> close() {
    _favoritesSubscription.cancel();
    return super.close();
  }
}
