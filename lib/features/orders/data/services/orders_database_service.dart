import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrdersDatabaseService {
  final SupabaseClient _client;

  OrdersDatabaseService(this._client);

  FutureJson readOrders(String userId) async {
    return _client
        .from(TableConstants.orders)
        .select()
        .eq(TableConstants.userId, userId)
        .order(TableConstants.createdAt);
  }

  Future<void> createOrder(Order order) async {
    await _client.from(TableConstants.orders).insert(order.toJson());
  }
}
