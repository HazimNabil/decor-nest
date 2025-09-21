import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_tile.dart';
import 'package:flutter/material.dart';

class CartTileSliverList extends StatelessWidget {
  final List<CartProduct> cartProducts;

  const CartTileSliverList({super.key, required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      sliver: SliverList.separated(
        itemCount: cartProducts.length,
        itemBuilder: (_, index) => CartTile(cartProduct: cartProducts[index]),
        separatorBuilder: (_, _) => const SizedBox(height: 16),
      ),
    );
  }
}
