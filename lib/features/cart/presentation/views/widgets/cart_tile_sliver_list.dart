import 'package:decor_nest/features/cart/presentation/views/widgets/cart_tile.dart';
import 'package:flutter/material.dart';

class CartTileSliverList extends StatelessWidget {
  const CartTileSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 15,
      itemBuilder: (_, _) => const CartTile(),
      separatorBuilder: (_, _) => const SizedBox(height: 16),
    );
  }
}
