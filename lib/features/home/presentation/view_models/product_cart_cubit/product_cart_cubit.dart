import 'package:decor_nest/features/cart/data/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:decor_nest/core/models/product.dart';

part 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  final CartRepo _cartRepo;

  ProductCartCubit(this._cartRepo) : super(const ProductCartState());

  Future<void> addToCart(Product product, int quantity) async {
    emit(state.copyWith(status: ProductCartStatus.loading));

    final result = await _cartRepo.addToCart(product, quantity);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ProductCartStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(status: ProductCartStatus.success, isInCart: true));
      },
    );
  }

  Future<void> initCartStatus(Product product) async {
    emit(state.copyWith(status: ProductCartStatus.loading));

    final isInCart = await _cartRepo.isInCart(product);
    emit(state.copyWith(status: ProductCartStatus.checked, isInCart: isInCart));
  }
}
