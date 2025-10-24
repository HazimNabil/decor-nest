import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/home/data/repos/home_repo.dart';
import 'package:decor_nest/features/home/data/services/home_database_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDatabaseService _databaseService;

  HomeRepoImpl(this._databaseService);

  @override
  FutureEither<List<Product>> fetchProducts({
    required int page,
    String? category,
  }) async {
    try {
      final jsonProducts = await _databaseService.readProducts(
        page: page,
        category: category,
      );

      final products = jsonProducts
          .map((jsonProduct) => Product.fromJson(jsonProduct))
          .toList();

      return right(products);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }
}
