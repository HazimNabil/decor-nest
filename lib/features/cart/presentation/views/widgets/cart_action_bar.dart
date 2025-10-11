import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/auth/data/services/auth_service.dart';
import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/data/models/payment_request.dart';
import 'package:decor_nest/features/cart/presentation/view_models/clear_cart_cubit/clear_cart_cubit.dart';
import 'package:decor_nest/features/cart/presentation/view_models/checkout_cubit/checkout_cubit.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/payment_status_dialog.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class CartActionBar extends StatelessWidget {
  final List<CartProduct> cartProducts;
  final double totalPayment;

  const CartActionBar({
    super.key,
    required this.cartProducts,
    required this.totalPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Payment', style: AppStyles.medium16(context)),
              Text(
                '\$${totalPayment.toStringAsFixed(2)}',
                style: AppStyles.medium16(context),
              ),
            ],
          ),
          const SizedBox(height: 24),
          BlocConsumer<CheckoutCubit, CheckoutState>(
            listener: (context, state) async {
              if (state is PaymentSuccess) {
                await _handlePaymentSuccess(context, state);
              } else if (state is PaymentFailure) {
                showDialog(
                  context: context,
                  builder: (_) => PaymentStatusDialog(state: state),
                );
              } else if (state is CheckoutFailure) {
                context.showToast(
                  message: state.message,
                  type: ToastificationType.error,
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                text: 'Check out',
                color: context.primaryColor,
                isLoading: state is PaymentLoading,
                onPressed: () async {
                  await _processCheckout(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _processCheckout(BuildContext context) async {
    final paymentRequest = PaymentRequest(
      amount: totalPayment,
      context: context,
      title: Text(
        'Checkout',
        style: AppStyles.medium24(context).copyWith(color: Colors.white),
      ),
      appBarColor: context.primaryColor,
    );
    await context.read<CheckoutCubit>().processPayment(paymentRequest);
  }

  Future<void> _handlePaymentSuccess(
    BuildContext context,
    PaymentSuccess state,
  ) async {
    showDialog(
      context: context,
      builder: (_) => PaymentStatusDialog(state: state),
    );
    await context.read<CheckoutCubit>().decreaseStock(cartProducts);

    final userId = locator<AuthService>().currentUser!.id;
    final order = Order(
      userId: userId,
      createdAt: DateTime.now(),
      totalPrice: totalPayment,
      itemCount: cartProducts.length,
    );
    if (context.mounted) {
      await context.read<CheckoutCubit>().createOrder(order);
    }
    if (context.mounted) {
      await context.read<ClearCartCubit>().clearCart();
    }
  }
}
