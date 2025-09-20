import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  final CartRepo _cartRepo;

  ProductCartCubit(this._cartRepo) : super(const ProductCartInitial());

  Future<void> addToCart(CartProduct cartProduct) async {
    emit(const ProductCartLoading());

    final result = await _cartRepo.addToCart(cartProduct);
    result.fold(
      (failure) => emit(ProductCartFailure(failure.message)),
      (_) => emit(const ProductCartSuccess()),
    );
  }
}
