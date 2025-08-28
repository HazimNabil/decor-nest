import 'package:cached_network_image/cached_network_image.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';

class ProductCardInfo extends StatelessWidget {
  final Product product;

  const ProductCardInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            imageUrl: product.imageUrl!,
            width: 80,
            height: 80,
            fit: BoxFit.fill,
            errorWidget: (_, _, _) => const Icon(Icons.error),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                product.name,
                style: AppStyles.medium16(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${product.price.toStringAsFixed(2)}\$ • Stock: ${product.stock}',
                style: AppStyles.medium14(
                  context,
                ).copyWith(color: context.actionColor),
              ),
              Text(product.category, style: AppStyles.regular14(context)),
            ],
          ),
        ),
      ],
    );
  }
}
