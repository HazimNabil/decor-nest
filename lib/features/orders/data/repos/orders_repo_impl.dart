import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/errors/failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/features/auth/data/services/auth_service.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:decor_nest/features/orders/data/repos/orders_repo.dart';
import 'package:decor_nest/features/orders/data/services/orders_database_service.dart';
import 'package:fpdart/fpdart.dart' hide Order;
import 'package:supabase_flutter/supabase_flutter.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersDatabaseService _databaseService;
  final AuthService _authService;

  OrdersRepoImpl(this._databaseService, this._authService);

  @override
  FutureEither<List<Order>> fetchOrders() async {
    final userId = _authService.currentUser!.id;
    return _sendRequest(() async {
      final jsonOrders = await _databaseService.readOrders(userId);

      final orders = jsonOrders
          .map((jsonOrder) => Order.fromJson(jsonOrder))
          .toList();

      return orders;
    });
  }

  @override
  FutureEither<Unit> createOrder(Order order) async {
    return _sendRequest(() async {
      await _databaseService.createOrder(order);
      return unit;
    });
  }

  FutureEither<T> _sendRequest<T>(Future<T> Function() request) async {
    try {
      final response = await request();
      return right(response);
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
