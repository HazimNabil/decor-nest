import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';

abstract interface class SearchRepo {
  FutureEither<List<Product>> searchProducts({
    required int page,
    ProductFilter? filter,
  });
}
