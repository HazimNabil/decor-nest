import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartDatabaseService {
  final SupabaseClient _client;

  CartDatabaseService(this._client);

  Future<void> addToCart(CartProduct cartProduct) async {
    await _client.from(TableConstants.cart).insert(cartProduct.toJson());
  }

  Future<void> removeFromCart({
    required String userId,
    required int productId,
  }) async {
    await _client
        .from(TableConstants.cart)
        .delete()
        .eq(TableConstants.userId, userId)
        .eq(TableConstants.productId, productId);
  }

  Future<void> clearCart(String userId) async {
    await _client
        .from(TableConstants.cart)
        .delete()
        .eq(TableConstants.userId, userId);
  }

  Future<void> updateQuantity({required int id, required int quantity}) async {
    await _client
        .from(TableConstants.cart)
        .update({TableConstants.quantity: quantity})
        .eq(TableConstants.id, id);
  }

  Future<bool> isInCart({
    required String userId,
    required int productId,
  }) async {
    final response = await _client
        .from(TableConstants.cart)
        .select()
        .eq(TableConstants.userId, userId)
        .eq(TableConstants.productId, productId)
        .maybeSingle();

    return response != null;
  }

  StreamJson watchCart() {
    return _client
        .from(TableConstants.cart)
        .stream(primaryKey: [TableConstants.id])
        .order(TableConstants.createdAt);
  }
}
