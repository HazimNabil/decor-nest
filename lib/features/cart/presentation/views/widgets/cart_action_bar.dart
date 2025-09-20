import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CartActionBar extends StatelessWidget {
  final double totalPayment;

  const CartActionBar({super.key, required this.totalPayment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Payment', style: AppStyles.medium16(context)),
              Text(
                '\$${totalPayment.toStringAsFixed(2)}',
                style: AppStyles.medium16(context),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Check out',
            color: context.primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
