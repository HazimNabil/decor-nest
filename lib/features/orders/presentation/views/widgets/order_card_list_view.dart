import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:decor_nest/features/orders/presentation/views/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrderCardListView extends StatelessWidget {
  final List<Order> orders;

  const OrderCardListView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: orders.length,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (_, index) {
        return OrderCard(order: orders[index]);
      },
    );
  }
}
