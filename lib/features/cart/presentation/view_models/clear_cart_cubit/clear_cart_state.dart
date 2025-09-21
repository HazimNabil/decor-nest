part of 'clear_cart_cubit.dart';

sealed class ClearCartState extends Equatable {
  const ClearCartState();

  @override
  List<Object> get props => [];
}

final class ClearCartInitial extends ClearCartState {
  const ClearCartInitial();
}

final class ClearCartLoading extends ClearCartState {
  const ClearCartLoading();
}

final class ClearCartSuccess extends ClearCartState {
  const ClearCartSuccess();
}

final class ClearCartFailure extends ClearCartState {
  final String message;

  const ClearCartFailure(this.message);

  @override
  List<Object> get props => [message];
}
