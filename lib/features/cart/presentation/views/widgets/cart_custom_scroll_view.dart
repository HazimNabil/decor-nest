import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo_impl.dart';
import 'package:decor_nest/features/cart/data/services/payment_service.dart';
import 'package:decor_nest/features/cart/presentation/view_models/clear_cart_cubit/clear_cart_cubit.dart';
import 'package:decor_nest/features/cart/presentation/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_action_bar.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/cart_tile_sliver_list.dart';
import 'package:decor_nest/features/orders/data/repos/orders_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCustomScrollView extends StatelessWidget {
  final List<CartProduct> cartProducts;
  final double totalPayment;

  const CartCustomScrollView({
    super.key,
    required this.cartProducts,
    required this.totalPayment,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CartTileSliverList(cartProducts: cartProducts),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            spacing: 24,
            children: [
              const Spacer(),
              MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => CheckoutCubit(
                      paymentService: locator<PaymentService>(),
                      ordersRepo: locator<OrdersRepoImpl>(),
                      cartRepo: locator<CartRepoImpl>(),
                    ),
                  ),
                  BlocProvider(
                    create: (_) => ClearCartCubit(locator<CartRepoImpl>()),
                  ),
                ],
                child: CartActionBar(
                  cartProducts: cartProducts,
                  totalPayment: totalPayment,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
