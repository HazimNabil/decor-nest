part of 'toggle_favorite_cubit.dart';

sealed class ToggleFavoriteState extends Equatable {
  const ToggleFavoriteState();

  @override
  List<Object> get props => [];
}

final class ToggleFavoriteInitial extends ToggleFavoriteState {
  const ToggleFavoriteInitial();
}

final class ToggleFavoriteLoading extends ToggleFavoriteState {
  const ToggleFavoriteLoading();
}

final class ToggleFavoriteSuccess extends ToggleFavoriteState {
  const ToggleFavoriteSuccess();
}

final class ToggleFavoriteFailure extends ToggleFavoriteState {
  final String message;

  const ToggleFavoriteFailure(this.message);

  @override
  List<Object> get props => [message];
}
