import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/failure_indicator.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_custom_scroll_view.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_screen_app_bar.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/empty_cart_widget.dart';
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
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final dummyCartProduct = CartProduct.fromProduct(
            product: Product.dummy(),
            quantity: 1,
            userId: '1',
          );

          return switch (state) {
            CartLoading() => Skeletonizer(
              child: CartCustomScrollView(
                cartProducts: List.filled(20, dummyCartProduct),
                totalPayment: 0,
              ),
            ),
            CartLoaded(:final cartProducts) =>
              cartProducts.isEmpty
                  ? const EmptyCartWidget()
                  : CartCustomScrollView(
                      cartProducts: cartProducts,
                      totalPayment: state.totalPayment,
                    ),
            CartFailure(:final message) => FailureIndicator(message: message),
            _ => const SizedBox.shrink(),
          };
        },
      ),
    );
  }
}
