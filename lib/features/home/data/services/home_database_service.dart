import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeDatabaseService {
  final SupabaseClient _client;

  HomeDatabaseService(this._client);

  FutureJson readProducts({
    required int page,
    String? category,
  }) async {
    final start = page * TableConstants.pageSize;
    final end = start + TableConstants.pageSize - 1;

    var query = _client.from(TableConstants.products).select();

    if (category != null) {
      query = query.eq(TableConstants.category, category);
    }

    return query.order(TableConstants.createdAt).range(start, end);
  }
}
