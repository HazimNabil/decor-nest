import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_action_bar.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_tile_sliver_list.dart';
import 'package:flutter/material.dart';

class CartCustomScrollView extends StatelessWidget {
  final List<CartProduct> cartProducts;

  const CartCustomScrollView({super.key, required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CartTileSliverList(cartProducts: cartProducts),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Column(spacing: 24, children: [Spacer(), CartActionBar()]),
        ),
      ],
    );
  }
}
