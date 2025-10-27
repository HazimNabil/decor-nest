import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SearchDatabaseService {
  final SupabaseClient _client;

  SearchDatabaseService(this._client);

  FutureJson searchProducts({required int page, ProductFilter? filter}) async {
    final start = page * TableConstants.pageSize;
    final end = start + TableConstants.pageSize - 1;

    var query = _client.from(TableConstants.products).select();

    if (filter != null) {
      query = applyProductFilters(query, filter);
    }

    final sortBy =
        filter?.sortBy ?? (column: TableConstants.createdAt, ascending: false);

    return query
        .order(sortBy.column, ascending: sortBy.ascending)
        .range(start, end);
  }

  PostgrestFilterBuilder<PostgrestList> applyProductFilters(
    PostgrestFilterBuilder<PostgrestList> query,
    ProductFilter filter,
  ) {
    if (filter.categories.isNotEmpty) {
      query = query.inFilter(TableConstants.category, filter.categories);
    }

    if (filter.woodTypes.isNotEmpty) {
      query = query.inFilter(TableConstants.woodType, filter.woodTypes);
    }

    query = query.gte(TableConstants.price, filter.minPrice);
    query = query.lte(TableConstants.price, filter.maxPrice);

    if (filter.searchQuery.isNotEmpty) {
      query = query.ilike(TableConstants.name, '%${filter.searchQuery}%');
    }

    return query;
  }
}
