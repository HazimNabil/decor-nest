import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class ProductDetailsHeader extends StatelessWidget {
  final Product product;

  const ProductDetailsHeader({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(product.name, style: AppStyles.medium20(context)),
              ),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: AppStyles.medium20(
                  context,
                ).copyWith(color: context.actionColor),
              ),
            ],
          ),
          SizedBox(height: 24 * context.heightRatio),
          Text('Description', style: AppStyles.medium16(context)),
          const SizedBox(height: 8),
          Text(
            product.description,
            style: AppStyles.regular14(context),
          ),
        ],
      ),
    );
  }
}
