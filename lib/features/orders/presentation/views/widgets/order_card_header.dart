import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text('Order #123456', style: AppStyles.medium16(context)),
            Text('2023-06-15', style: AppStyles.regular14(context)),
          ],
        ),
        Text(
          '2 items',
          style: AppStyles.regular14(
            context,
          ).copyWith(color: context.textColor),
        ),
      ],
    );
  }
}
