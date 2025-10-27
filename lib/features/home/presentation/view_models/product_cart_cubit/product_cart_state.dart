part of 'product_cart_cubit.dart';

enum ProductCartStatus {
  initial,
  loading,
  success,
  failure,
  checked;

  bool get isLoading => this == ProductCartStatus.loading;
  bool get isSuccess => this == ProductCartStatus.success;
  bool get isFailure => this == ProductCartStatus.failure;
  bool get isChecked => this == ProductCartStatus.checked;
}

class ProductCartState extends Equatable {
  final ProductCartStatus status;
  final bool isInCart;
  final String? errorMessage;

  const ProductCartState({
    this.status = ProductCartStatus.initial,
    this.errorMessage,
    this.isInCart = false,
  });

  @override
  List<Object?> get props => [status, isInCart, errorMessage];

  ProductCartState copyWith({
    ProductCartStatus? status,
    bool? isInCart,
    String? errorMessage,
  }) {
    return ProductCartState(
      status: status ?? this.status,
      isInCart: isInCart ?? this.isInCart,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
