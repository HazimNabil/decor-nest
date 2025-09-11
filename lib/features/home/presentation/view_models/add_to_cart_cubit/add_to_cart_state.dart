part of 'add_to_cart_cubit.dart';

sealed class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

final class AddToCartInitial extends AddToCartState {
  const AddToCartInitial();
}

final class AddToCartLoading extends AddToCartState {
  const AddToCartLoading();
}

final class AddToCartSuccess extends AddToCartState {
  const AddToCartSuccess();
}

final class AddToCartFailure extends AddToCartState {
  final String message;

  const AddToCartFailure(this.message);

  @override
  List<Object> get props => [message];
}
