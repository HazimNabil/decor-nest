import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/orders/presentation/views/widgets/order_card_header.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

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
          const OrderCardHeader(),
          Divider(height: 1, color: context.primaryColor),
          Text(
            'Total: \$123.45',
            style: AppStyles.medium16(
              context,
            ).copyWith(color: context.actionColor),
          ),
        ],
      ),
    );
  }
}
