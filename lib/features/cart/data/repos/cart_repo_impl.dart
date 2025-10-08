import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/errors/failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/auth/data/services/auth_service.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo.dart';
import 'package:decor_nest/features/cart/data/services/cart_database_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartRepoImpl implements CartRepo {
  final CartDatabaseService _databaseService;
  final AuthService _authService;

  CartRepoImpl(
    this._databaseService,
    this._authService,
  );

  @override
  FutureEither<Unit> addToCart(Product product, int quantity) async {
    try {
      final userId = _authService.currentUser!.id;
      final cartProduct = CartProduct.fromProduct(
        product: product,
        quantity: quantity,
        userId: userId,
      );

      await _databaseService.addToCart(cartProduct);
      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<bool> isInCart(Product product) async {
    try {
      final userId = _authService.currentUser!.id;
      return await _databaseService.isInCart(
        userId: userId,
        productId: product.id!,
      );
    } catch (e) {
      return false;
    }
  }

  @override
  FutureEither<Unit> removeFromCart(CartProduct cartProduct) async {
    try {
      await _databaseService.removeFromCart(
        userId: cartProduct.userId,
        productId: cartProduct.productId,
      );
      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  FutureEither<Unit> clearCart() async {
    try {
      final userId = _authService.currentUser!.id;
      await _databaseService.clearCart(userId);
      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  StreamEither<List<CartProduct>> watchCart() {
    try {
      return _databaseService.watchCart().map(_parseJson);
    } on PostgrestException catch (e) {
      return Stream.value(left(DatabaseFailure.fromException(e)));
    } catch (e) {
      return Stream.value(left(DatabaseFailure(e.toString())));
    }
  }

  Either<Failure, List<CartProduct>> _parseJson(
    List<Map<String, dynamic>> jsonCartProducts,
  ) {
    try {
      final cartProducts = jsonCartProducts
          .map((json) => CartProduct.fromJson(json))
          .toList();
      return right(cartProducts);
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  FutureEither<Unit> updateQuantity(int id, int newQuantity) async {
    try {
      await _databaseService.updateQuantity(id: id, quantity: newQuantity);
      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }
}
