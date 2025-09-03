import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key});

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
              Text('Product Name', style: AppStyles.medium24(context)),
              Text(
                r'$100',
                style: AppStyles.medium24(
                  context,
                ).copyWith(color: context.actionColor),
              ),
            ],
          ),
          SizedBox(height: 32 * context.heightRatio),
          Text('Description', style: AppStyles.medium20(context)),
          const SizedBox(height: 8),
          Text(
            'The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.',
            style: AppStyles.regular14(context),
          ),
        ],
      ),
    );
  }
}
