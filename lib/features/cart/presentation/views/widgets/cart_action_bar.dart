import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/cart/data/models/payment_request.dart';
import 'package:decor_nest/features/cart/presentation/view_models/clear_cart_cubit/clear_cart_cubit.dart';
import 'package:decor_nest/features/cart/presentation/view_models/payment_cubit/payment_cubit.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/payment_status_dialog.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class CartActionBar extends StatelessWidget {
  final double totalPayment;
  final int itemCount;

  const CartActionBar({
    super.key,
    required this.totalPayment,
    required this.itemCount,
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
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) async {
              if (state is PaymentSuccess) {
                showDialog(
                  context: context,
                  builder: (_) => PaymentStatusDialog(state: state),
                );
                await context.read<ClearCartCubit>().clearCart();
                final userId = await CacheHelper.getSecureData(
                  CacheConstants.userId,
                );
                final order = Order(
                  userId: userId,
                  createdAt: DateTime.now(),
                  totalPrice: totalPayment,
                  itemCount: itemCount,
                );
                if (context.mounted) {
                  await context.read<PaymentCubit>().createOrder(order);
                }
              } else if (state is PaymentFailure) {
                showDialog(
                  context: context,
                  builder: (_) => PaymentStatusDialog(state: state),
                );
              } else if (state is CreateOrderFailure) {
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
                  final paymentRequest = PaymentRequest(
                    amount: totalPayment,
                    context: context,
                    title: Text(
                      'Checkout',
                      style: AppStyles.medium24(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    appBarColor: context.primaryColor,
                  );
                  await context.read<PaymentCubit>().processPayment(
                    paymentRequest,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
