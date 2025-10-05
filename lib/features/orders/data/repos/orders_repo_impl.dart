import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/services/database_service.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:decor_nest/features/orders/data/repos/orders_repo.dart';
import 'package:fpdart/fpdart.dart' hide Order;
import 'package:supabase_flutter/supabase_flutter.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService _databaseService;

  OrdersRepoImpl(this._databaseService);

  @override
  FutureEither<List<Order>> fetchOrders() async {
    final userId = await CacheHelper.getSecureData(CacheConstants.userId);
    try {
      final jsonOrders = await _databaseService.readByUserId(
        tableName: TableConstants.orders,
        userId: userId,
      );

      final orders = jsonOrders
          .map((jsonOrder) => Order.fromJson(jsonOrder))
          .toList();

      return right(orders);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }

  @override
  FutureEither<Unit> createOrder(Order order) async {
    try {
      await _databaseService.add(
        tableName: TableConstants.orders,
        record: order,
      );
      return right(unit);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }
}
