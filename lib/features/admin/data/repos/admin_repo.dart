import 'dart:io' show File;

import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:fpdart/fpdart.dart' show Unit;

abstract interface class AdminRepo {
  FutureEither<Unit> addProduct({
    required Product product,
    required File image,
  });
  FutureEither<Unit> updateProduct({
    required Product product,
    File? image,
    required Map<String, dynamic> fields,
  });
  FutureEither<Unit> deleteProduct({required Product product});
  FutureEither<List<Product>> readProducts({required int page});
  FutureEither<List<Product>> searchProducts({
    required String query,
    required int page,
  });
}
