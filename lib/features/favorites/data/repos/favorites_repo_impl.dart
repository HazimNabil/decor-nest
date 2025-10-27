import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/errors/failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/auth/data/services/auth_service.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:decor_nest/features/favorites/data/services/favorites_database_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesDatabaseService _databaseService;
  final AuthService _authService;

  FavoritesRepoImpl(this._databaseService, this._authService);

  @override
  Future<bool> isFavorite(Product product) async {
    try {
      final userId = _authService.currentUser!.id;
      return await _databaseService.isFavorite(
        userId: userId,
        productId: product.id!,
      );
    } catch (e) {
      return false;
    }
  }

  @override
  FutureEither<Unit> removeFromFavorite(FavoriteProduct favorite) async {
    try {
      await _databaseService.removeFavorite(
        userId: favorite.userId,
        productId: favorite.productId,
      );

      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  FutureEither<bool> toggleFavorite(Product product) async {
    try {
      final userId = _authService.currentUser!.id;
      final favorite = FavoriteProduct.fromProduct(product, userId);

      final isFavorite = await this.isFavorite(product);
      if (isFavorite) {
        await _databaseService.removeFavorite(
          userId: favorite.userId,
          productId: favorite.productId,
        );
      } else {
        await _databaseService.addFavorite(favorite);
      }

      return right(!isFavorite);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  StreamEither<List<FavoriteProduct>> watchFavorites() {
    try {
      return _databaseService.watchFavorites().map(_parseJson);
    } on PostgrestException catch (e) {
      return Stream.value(left(DatabaseFailure.fromException(e)));
    } catch (e) {
      return Stream.value(left(Failure(e.toString())));
    }
  }

  Either<Failure, List<FavoriteProduct>> _parseJson(
    List<Map<String, dynamic>> jsonFavorites,
  ) {
    try {
      final favorites = jsonFavorites
          .map((json) => FavoriteProduct.fromJson(json))
          .toList();
      return right(favorites);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
