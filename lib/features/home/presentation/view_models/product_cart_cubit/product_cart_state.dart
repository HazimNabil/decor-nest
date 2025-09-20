part of 'product_cart_cubit.dart';

sealed class ProductCartState extends Equatable {
  const ProductCartState();

  @override
  List<Object> get props => [];
}

final class ProductCartInitial extends ProductCartState {
  const ProductCartInitial();
}

final class ProductCartLoading extends ProductCartState {
  const ProductCartLoading();
}

final class ProductCartSuccess extends ProductCartState {
  const ProductCartSuccess();
}

final class ProductCartFailure extends ProductCartState {
  final String message;

  const ProductCartFailure(this.message);

  @override
  List<Object> get props => [message];
}
