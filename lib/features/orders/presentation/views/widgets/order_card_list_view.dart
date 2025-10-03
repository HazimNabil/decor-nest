import 'package:decor_nest/features/orders/presentation/views/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrderCardListView extends StatelessWidget {
  const OrderCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: 10,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (_, _) {
        return const OrderCard();
      },
    );
  }
}
