import 'dart:async';

import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  late final StreamSubscription _subscription;

  CartCubit(this._cartRepo) : super(const CartInitial()) {
    _listenToCart();
  }

  void _listenToCart() {
    emit(const CartLoading());

    final cartStream = _cartRepo.watchCart();
    _subscription = cartStream.listen((result) {
      result.fold(
        (failure) => emit(CartFailure(failure.message)),
        (cartProducts) => emit(CartLoaded(cartProducts)),
      );
    });
  }

  Future<void> updateQuantity(int id, int newQuantity) async {
    final currentState = state;
    if (currentState is! CartLoaded) return;

    final updatedProducts = currentState.cartProducts.map((product) {
      if (product.id == id) return product.copyWith(quantity: newQuantity);
      return product;
    }).toList();

    emit(CartLoaded(updatedProducts));

    final result = await _cartRepo.updateQuantity(id, newQuantity);
    result.fold((failure) => emit(CartFailure(failure.message)), (_) {});
  }

  Future<void> removeFromCart(CartProduct cartProduct) async {
    final result = await _cartRepo.removeFromCart(cartProduct);
    result.fold((failure) => emit(CartFailure(failure.message)), (_) {});
  }

  Future<void> clearCart() async {
    final result = await _cartRepo.clearCart();
    result.fold((failure) => emit(CartFailure(failure.message)), (_) {});
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
