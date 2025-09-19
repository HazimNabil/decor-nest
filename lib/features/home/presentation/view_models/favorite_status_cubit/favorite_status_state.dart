part of 'favorite_status_cubit.dart';

enum FavoriteStatus { initial, loading, success, failure }

extension FavoriteStatusExtension on FavoriteStatus {
  bool get isLoading => this == FavoriteStatus.loading;
  bool get isSuccess => this == FavoriteStatus.success;
  bool get isFailure => this == FavoriteStatus.failure;
}

class FavoriteStatusState extends Equatable {
  final FavoriteStatus status;
  final bool isFavorite;
  final String? errorMessage;

  const FavoriteStatusState({
    this.status = FavoriteStatus.initial,
    this.isFavorite = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, isFavorite, errorMessage];

  FavoriteStatusState copyWith({
    FavoriteStatus? status,
    bool? isFavorite,
    String? errorMessage,
  }) {
    return FavoriteStatusState(
      status: status ?? this.status,
      isFavorite: isFavorite ?? this.isFavorite,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
