import 'package:decor_nest/features/cart/presentation/views/widgets/cart_screen_app_bar.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_tile_sliver_list.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_action_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const path = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CartScreenAppBar(),
      body: CustomScrollView(
        slivers: [
          CartTileSliverList(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(spacing: 24, children: [Spacer(), CartActionBar()]),
          ),
        ],
      ),
    );
  }
}
