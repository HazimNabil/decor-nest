import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:decor_nest/core/models/product.dart';

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
    await _supabase.from(tableName).update(fields).eq('id', id);
  }

  Future<void> delete({required String tableName, required int id}) async {
    await _supabase.from(tableName).delete().eq('id', id);
  }

  FutureJson read({required String tableName, required int page}) async {
    final start = page * _pageSize;
    final end = start + _pageSize - 1;

    final data = await _supabase
        .from(tableName)
        .select()
        .order('created_at', ascending: false)
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
        .eq('category', category)
        .order('created_at', ascending: false)
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
        .ilike('name', '%$query%')
        .order('created_at', ascending: false)
        .range(start, end);

    return data;
  }
}
