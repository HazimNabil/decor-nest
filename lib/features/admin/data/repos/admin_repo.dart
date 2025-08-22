import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:fpdart/fpdart.dart' show Unit;

abstract interface class AdminRepo {
  FutureEither<Unit> addProduct(Product product);
  FutureEither<Unit> updateProduct(int id, Map<String, dynamic> fields);
  FutureEither<Unit> deleteProduct(int id);
  FutureEither<List<Product>> readProducts(int page);
  FutureEither<List<Product>> searchProducts(String query, int page);
}
