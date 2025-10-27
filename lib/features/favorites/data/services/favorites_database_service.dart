import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesDatabaseService {
  final SupabaseClient _client;

  FavoritesDatabaseService(this._client);

  Future<bool> isFavorite({
    required String userId,
    required int productId,
  }) async {
    final response = await _client
        .from(TableConstants.favorites)
        .select()
        .eq(TableConstants.userId, userId)
        .eq(TableConstants.productId, productId)
        .maybeSingle();

    return response != null;
  }

  Future<void> addFavorite(FavoriteProduct favorite) async {
    await _client.from(TableConstants.favorites).insert(favorite.toJson());
  }

  Future<void> removeFavorite({
    required String userId,
    required int productId,
  }) async {
    await _client
        .from(TableConstants.favorites)
        .delete()
        .eq(TableConstants.userId, userId)
        .eq(TableConstants.productId, productId);
  }

  StreamJson watchFavorites() {
    return _client
        .from(TableConstants.favorites)
        .stream(primaryKey: [TableConstants.id])
        .order(TableConstants.createdAt);
  }
}
