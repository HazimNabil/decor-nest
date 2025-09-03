import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/services/database_service.dart';
import 'package:decor_nest/features/home/data/repos/home_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepoImpl implements HomeRepo {
  final DatabaseService _databaseService;

  HomeRepoImpl(this._databaseService);

  @override
  FutureEither<List<Product>> fetchProducts({
    required int page,
    String? category,
  }) async {
    try {
      final List<Map<String, dynamic>> jsonProducts;

      jsonProducts = await _fetchFromDatabase(category, page);

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

  FutureJson _fetchFromDatabase(String? category, int page) async {
    if (category == null) {
      return await _databaseService.read(
        tableName: TableNames.products,
        page: page,
      );
    }
    return await _databaseService.filterByCategory(
      tableName: TableNames.products,
      page: page,
      category: category,
    );
  }
}
