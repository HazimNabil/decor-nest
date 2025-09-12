import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final CartRepo _cartRepo;

  AddToCartCubit(this._cartRepo) : super(const AddToCartInitial());

  Future<void> addToCart(CartProduct cartProduct) async {
    emit(const AddToCartLoading());

    final result = await _cartRepo.addToCart(cartProduct);
    result.fold(
      (failure) => emit(AddToCartFailure(failure.message)),
      (_) => emit(const AddToCartSuccess()),
    );
  }
}
