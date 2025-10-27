import 'package:cached_network_image/cached_network_image.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/quantity_buttons.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_tile_info.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';

class CartTile extends StatelessWidget {
  final CartProduct cartProduct;

  const CartTile({super.key, required this.cartProduct});

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
            child: CachedNetworkImage(
              imageUrl: cartProduct.imageUrl!,
              height: 72,
              width: 72,
              errorWidget: (_, _, _) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: CartTileInfo(cartProduct: cartProduct)),
          QuantityButtons(cartProduct: cartProduct),
        ],
      ),
    );
  }
}
