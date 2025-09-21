import 'package:decor_nest/features/cart/data/repos/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'clear_cart_state.dart';

class ClearCartCubit extends Cubit<ClearCartState> {
  final CartRepo _cartRepo;

  ClearCartCubit(this._cartRepo) : super(const ClearCartInitial());

  Future<void> clearCart() async {
    emit(const ClearCartLoading());

    final result = await _cartRepo.clearCart();
    result.fold(
      (failure) => emit(ClearCartFailure(failure.message)),
      (_) => emit(const ClearCartSuccess()),
    );
  }
}
