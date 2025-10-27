import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:decor_nest/features/search/data/repos/search_repo.dart';
import 'package:decor_nest/features/search/data/services/search_database_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchDatabaseService _databaseService;

  SearchRepoImpl(this._databaseService);

  @override
  FutureEither<List<Product>> searchProducts({
    required int page,
    ProductFilter? filter,
  }) async {
    try {
      final jsonProducts = await _databaseService.searchProducts(
        page: page,
        filter: filter,
      );

      final data = jsonProducts
          .map((jsonProduct) => Product.fromJson(jsonProduct))
          .toList();

      return right(data);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }
}
