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
  final bool isQuantityUpdating;

  const CartLoaded(this.cartProducts, {this.isQuantityUpdating = false});

  double get totalPayment {
    return cartProducts.fold(0.0, (sum, product) => sum + product.totalPrice);
  }

  @override
  List<Object> get props => [cartProducts, isQuantityUpdating];
}

final class CartFailure extends CartState {
  final String message;

  const CartFailure(this.message);

  @override
  List<Object> get props => [message];
}
