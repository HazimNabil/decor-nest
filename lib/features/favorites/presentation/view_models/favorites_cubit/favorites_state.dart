part of 'favorites_cubit.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoadInProgress extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<FavoriteProduct> favorites;

  const FavoritesLoaded(this.favorites);

  @override
  List<Object> get props => [favorites];
}

final class FavoritesLoadFailure extends FavoritesState {
  final String message;

  const FavoritesLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
