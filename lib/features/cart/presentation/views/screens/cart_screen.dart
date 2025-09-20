import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/failure_indicator.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_screen_app_bar.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_tile_sliver_list.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartScreen extends StatelessWidget {
  static const path = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartScreenAppBar(),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final dummyCartProduct = CartProduct.fromProduct(
                product: Product.dummy(),
                quantity: 0,
                userId: '',
              );

              return switch (state) {
                CartLoading() => Skeletonizer.sliver(
                  child: CartTileSliverList(
                    cartProducts: List.filled(10, dummyCartProduct),
                  ),
                ),
                CartLoaded(:final cartProducts) => CartTileSliverList(
                  cartProducts: cartProducts,
                ),
                CartFailure(:final message) => SliverToBoxAdapter(
                  child: FailureIndicator(message: message),
                ),
                _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
              };
            },
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Column(spacing: 24, children: [Spacer(), CartActionBar()]),
          ),
        ],
      ),
    );
  }
}
