import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/base_product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final _supabase = Supabase.instance.client;
  static const _pageSize = 10;

  Future<void> add({
    required String tableName,
    required BaseProduct product,
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

  FutureJson read({required String tableName, required int page}) async {
    final start = page * _pageSize;
    final end = start + _pageSize - 1;

    final data = await _supabase
        .from(tableName)
        .select()
        .order(TableConstants.createdAt, ascending: false)
        .range(start, end);

    return data;
  }

  FutureJson filterByCategory({
    required String tableName,
    required int page,
    required String category,
  }) async {
    final start = page * _pageSize;
    final end = start + _pageSize - 1;

    final data = await _supabase
        .from(tableName)
        .select()
        .eq(TableConstants.category, category)
        .order(TableConstants.createdAt, ascending: false)
        .range(start, end);

    return data;
  }

  FutureJson search({
    required String tableName,
    required String query,
    required int page,
  }) async {
    final start = page * _pageSize;
    final end = start + _pageSize - 1;

    final data = await _supabase
        .from(tableName)
        .select()
        .ilike(TableConstants.name, '%$query%')
        .order(TableConstants.createdAt, ascending: false)
        .range(start, end);

    return data;
  }
}
