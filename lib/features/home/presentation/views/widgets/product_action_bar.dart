import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProductActionBar extends StatelessWidget {
  const ProductActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: context.backgroundColor,
                foregroundColor: context.subTextColor,
                child: const Icon(Icons.remove),
              ),
              Text(
                '01',
                style: AppStyles.regular14(
                  context,
                ).copyWith(color: context.textColor),
              ),
              CircleAvatar(
                radius: 13,
                backgroundColor: context.primaryColor,
                foregroundColor: Colors.white,
                child: const Icon(Icons.add),
              ),
              const Spacer(),
              Text(r'Total: $100.00', style: AppStyles.medium16(context)),
            ],
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Add To Cart',
            icon: Assets.iconsAddToCart,
            color: context.primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
