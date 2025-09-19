import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class FavoritesRepo {
  Future<bool> isFavorite(Product product);
  FutureEither<Unit> removeFromFavorite(FavoriteProduct favorite);
  FutureEither<bool> toggleFavorite(Product product);
  StreamEither<List<FavoriteProduct>> watchFavorites();
}
