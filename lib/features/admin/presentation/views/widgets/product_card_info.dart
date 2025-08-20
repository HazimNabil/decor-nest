import 'package:flutter/material.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';

class ProductCardInfo extends StatelessWidget {
  const ProductCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            Assets.imagesLamp,
            width: 88,
            height: 88,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mid-century Modern Table Lamp',
                style: AppStyles.medium16(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                r'$120.00 • Stock: 10',
                style: AppStyles.medium14(
                  context,
                ).copyWith(color: context.actionColor),
              ),
              const SizedBox(height: 4),
              Text('Wood Type: Oak', style: AppStyles.regular14(context)),
            ],
          ),
        ),
      ],
    );
  }
}
