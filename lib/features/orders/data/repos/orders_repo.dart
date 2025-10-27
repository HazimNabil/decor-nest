import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:fpdart/fpdart.dart' hide Order;

abstract interface class OrdersRepo {
  FutureEither<List<Order>> fetchOrders();
  FutureEither<Unit> createOrder(Order order);
}
