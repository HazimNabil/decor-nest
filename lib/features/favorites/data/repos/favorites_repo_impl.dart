import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/services/database_service.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final DatabaseService _databaseService;

  FavoritesRepoImpl(this._databaseService);

  @override
  FutureEither<Unit> toggleFavorite({
    required FavoriteProduct favorite,
    required bool isFavorite,
  }) async {
    try {
      if (isFavorite) {
        await _databaseService.add(
          tableName: TableConstants.favorites,
          product: favorite,
        );
      } else {
        await _databaseService.deleteByFields(
          tableName: TableConstants.favorites,
          fields: {
            TableConstants.userId: favorite.userId,
            TableConstants.productId: favorite.productId,
          },
        );
      }
      await _databaseService.update(
        tableName: TableConstants.products,
        id: favorite.productId,
        fields: {TableConstants.isFavorite: isFavorite},
      );
      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }
}
