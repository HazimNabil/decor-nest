import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class CartTileInfo extends StatelessWidget {
  const CartTileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Minimalist Chair',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.semiBold16(
            context,
          ).copyWith(color: context.textColor),
        ),
        Text(
          'Wood Type',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.regular13(context),
        ),
        const SizedBox(height: 12),
        Text(
          '\$120.00',
          style: AppStyles.medium16(
            context,
          ).copyWith(color: context.actionColor),
        ),
      ],
    );
  }
}
