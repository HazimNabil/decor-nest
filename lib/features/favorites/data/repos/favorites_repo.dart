import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/favorites/data/models/favorite_product.dart';

abstract interface class FavoritesRepo {
  FutureEither<bool> toggleFavorite(Product product);
  Future<bool> isFavorite(Product product);
  StreamEither<List<FavoriteProduct>> watchFavorites();
}
