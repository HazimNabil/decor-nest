import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminDatabaseService {
  final SupabaseClient _client;

  AdminDatabaseService(this._client);

  Future<void> addProduct(Product product) async {
    await _client.from(TableConstants.products).insert(product.toJson());
  }

  Future<void> deleteProduct(int id) async {
    await _client
        .from(TableConstants.products)
        .delete()
        .eq(TableConstants.id, id);
  }

  Future<void> updateProduct({
    required int id,
    required Map<String, dynamic> fields,
  }) async {
    await _client
        .from(TableConstants.products)
        .update(fields)
        .eq(TableConstants.id, id);
  }

  FutureJson readProducts({required int page}) async {
    final start = page * TableConstants.pageSize;
    final end = start + TableConstants.pageSize - 1;

    final query = _client
        .from(TableConstants.products)
        .select()
        .order(TableConstants.createdAt)
        .range(start, end);

    return await query;
  }

  FutureJson searchProducts({required int page, String? searchQuery}) async {
    final start = page * TableConstants.pageSize;
    final end = start + TableConstants.pageSize - 1;

    final query = _client
        .from(TableConstants.products)
        .select()
        .ilike(TableConstants.name, '%$searchQuery%')
        .order(TableConstants.createdAt)
        .range(start, end);

    return await query;
  }
}
