import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/amount_buttons.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_tile_info.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(Assets.imagesLamp, height: 72, width: 72),
          ),
          const SizedBox(width: 16),
          const CartTileInfo(),
          const Spacer(),
          const AmountButtons(),
        ],
      ),
    );
  }
}
