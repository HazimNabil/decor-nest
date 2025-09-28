import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final _supabase = Supabase.instance.client;
  static const _pageSize = 10;

  Future<void> add({
    required String tableName,
    required Product product,
  }) async {
    await _supabase.from(tableName).insert(product.toJson());
  }

  Future<void> update({
    required String tableName,
    required int id,
    required Map<String, dynamic> fields,
  }) async {
    await _supabase.from(tableName).update(fields).eq(TableConstants.id, id);
  }

  Future<void> delete({required String tableName, required int id}) async {
    await _supabase.from(tableName).delete().eq(TableConstants.id, id);
  }

  Future<void> deleteByFields({
    required String tableName,
    required Map<String, dynamic> fields,
  }) async {
    var query = _supabase.from(tableName).delete();

    fields.forEach((key, value) {
      query = query.eq(key, value);
    });

    await query;
  }

  Future<void> clear({required String tableName}) async {
    await _supabase.from(tableName).delete().neq(TableConstants.id, -1);
  }

  FutureJson read({
    required String tableName,
    required int page,
    String? category,
  }) async {
    final start = page * _pageSize;
    final end = start + _pageSize - 1;

    var query = _supabase.from(tableName).select();

    if (category != null) {
      query = query.eq(TableConstants.category, category);
    }

    final data = await query.order(TableConstants.createdAt).range(start, end);
    return data;
  }

  FutureJson search({
    required String tableName,
    required int page,
    ProductFilter? filter,
  }) async {
    final start = page * _pageSize;
    final end = start + _pageSize - 1;

    var query = _supabase.from(tableName).select();

    if (filter != null) {
      query = _applyFilters(query, filter);
    }

    final sortBy =
        filter?.sortBy ?? (column: TableConstants.createdAt, ascending: false);

    final data = await query
        .order(sortBy.column, ascending: sortBy.ascending)
        .range(start, end);

    return data;
  }

  StreamJson stream({required String tableName}) {
    return _supabase
        .from(tableName)
        .stream(primaryKey: [TableConstants.id])
        .order(TableConstants.createdAt);
  }

  Future<bool> isFound({
    required String tableName,
    required int productId,
    required String userId,
  }) async {
    final response = await _supabase
        .from(tableName)
        .select()
        .eq(TableConstants.userId, userId)
        .eq(TableConstants.productId, productId)
        .maybeSingle();

    return response != null;
  }

  PostgrestFilterBuilder<PostgrestList> _applyFilters(
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
