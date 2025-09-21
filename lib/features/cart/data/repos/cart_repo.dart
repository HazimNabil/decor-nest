import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:fpdart/fpdart.dart' show Unit;

abstract interface class CartRepo {
  FutureEither<Unit> addToCart(Product product, int quantity);
  FutureEither<Unit> removeFromCart(CartProduct cartProduct);
  FutureEither<Unit> updateQuantity(int id, int newQuantity);
  FutureEither<Unit> clearCart();
  Future<bool> isInCart(Product product);
  StreamEither<List<CartProduct>> watchCart();
}
