import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:fpdart/fpdart.dart' show Unit;

abstract interface class HomeRepo {
  FutureEither<List<Product>> fetchProducts({
    required int page,
    String? category,
  });
  FutureEither<Unit> toggleFavorite({
    required int productId,
    required bool isFavorite,
  });
}
