part of 'toggle_favorite_cubit.dart';

enum ToggleFavoriteStatus { initial, loading, success, failure }

extension ToggleFavoriteStatusExtension on ToggleFavoriteStatus {
  bool get isLoading => this == ToggleFavoriteStatus.loading;
  bool get isSuccess => this == ToggleFavoriteStatus.success;
  bool get isFailure => this == ToggleFavoriteStatus.failure;
}

class ToggleFavoriteState extends Equatable {
  final ToggleFavoriteStatus status;
  final bool isFavorite;
  final String? errorMessage;

  const ToggleFavoriteState({
    this.status = ToggleFavoriteStatus.initial,
    this.isFavorite = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, isFavorite, errorMessage];

  ToggleFavoriteState copyWith({
    ToggleFavoriteStatus? status,
    bool? isFavorite,
    String? errorMessage,
  }) {
    return ToggleFavoriteState(
      status: status ?? this.status,
      isFavorite: isFavorite ?? this.isFavorite,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
