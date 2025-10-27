import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:flutter/material.dart';

class OrderCardHeader extends StatelessWidget {
  final Order order;

  const OrderCardHeader({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text('Order #${order.id}', style: AppStyles.medium16(context)),
            Text(
              order.createdAt.formatted,
              style: AppStyles.regular14(context),
            ),
          ],
        ),
        Text(
          '${order.itemCount} items',
          style: AppStyles.regular14(
            context,
          ).copyWith(color: context.textColor),
        ),
      ],
    );
  }
}
