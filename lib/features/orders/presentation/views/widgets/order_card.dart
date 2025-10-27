import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:decor_nest/features/orders/presentation/views/widgets/order_card_header.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 12,
        children: [
          OrderCardHeader(order: order),
          Divider(height: 1, color: context.primaryColor),
          Text(
            'Total: \$${order.totalPrice}',
            style: AppStyles.medium16(
              context,
            ).copyWith(color: context.actionColor),
          ),
        ],
      ),
    );
  }
}
