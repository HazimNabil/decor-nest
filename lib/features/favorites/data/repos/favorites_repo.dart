import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class FavoritesRepo {
  FutureEither<Unit> toggleFavorite({
    required FavoriteProduct favorite,
    required bool isFavorite,
  });
  StreamEither<List<FavoriteProduct>> watchFavorites();
}
