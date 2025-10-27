import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';

class CartTileInfo extends StatelessWidget {
  final CartProduct cartProduct;

  const CartTileInfo({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartProduct.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.semiBold16(
            context,
          ).copyWith(color: context.textColor),
        ),
        Text(
          cartProduct.woodType ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.regular13(context),
        ),
        const SizedBox(height: 12),
        Text(
          '\$${cartProduct.price.toStringAsFixed(2)}',
          style: AppStyles.medium16(
            context,
          ).copyWith(color: context.actionColor),
        ),
      ],
    );
  }
}
