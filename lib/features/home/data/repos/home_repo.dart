import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/helper/typedefs.dart';

abstract interface class HomeRepo {
  FutureEither<List<Product>> fetchProducts({
    required int page,
    String? category,
  });
}
