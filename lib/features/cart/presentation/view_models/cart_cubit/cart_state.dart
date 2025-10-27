part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {
  const CartInitial();
}

final class CartLoading extends CartState {
  const CartLoading();
}

final class CartLoaded extends CartState {
  final List<CartProduct> cartProducts;

  const CartLoaded(this.cartProducts);

  double get totalPayment {
    return cartProducts.fold(0.0, (sum, product) => sum + product.totalPrice);
  }

  @override
  List<Object> get props => [cartProducts];
}

final class CartFailure extends CartState {
  final String message;

  const CartFailure(this.message);

  @override
  List<Object> get props => [message];
}
