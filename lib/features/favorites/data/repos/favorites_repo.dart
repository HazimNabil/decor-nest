import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';

abstract interface class FavoritesRepo {
  FutureEither<bool> toggleFavorite(FavoriteProduct favorite);
  StreamEither<List<FavoriteProduct>> watchFavorites();
}
