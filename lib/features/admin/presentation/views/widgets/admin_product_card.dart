import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/product_card_info.dart';
import 'package:flutter/material.dart';

class AdminProductCard extends StatelessWidget {
  const AdminProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(14),
      child: const ProductCardInfo(),
    );
  }
}
