import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class OutOfStockIndicator extends StatelessWidget {
  const OutOfStockIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(
          'Out of stock',
          style: AppStyles.medium20(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
