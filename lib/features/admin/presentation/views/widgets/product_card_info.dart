import 'package:flutter/material.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';

class ProductCardInfo extends StatelessWidget {
  const ProductCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            Assets.imagesLamp,
            width: 80,
            height: 80,
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'Mid-century Modern Table Lamp',
                style: AppStyles.medium16(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                r'$120.00 • Stock: 10',
                style: AppStyles.medium14(
                  context,
                ).copyWith(color: context.actionColor),
              ),
              Text('Wood Type: Oak', style: AppStyles.regular14(context)),
            ],
          ),
        ),
      ],
    );
  }
}
