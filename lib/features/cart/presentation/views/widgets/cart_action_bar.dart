import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/cart/data/models/payment_request.dart';
import 'package:decor_nest/features/cart/presentation/view_models/clear_cart_cubit/clear_cart_cubit.dart';
import 'package:decor_nest/features/cart/presentation/view_models/payment_cubit/payment_cubit.dart';
import 'package:decor_nest/features/cart/presentation/views/widgets/payment_status_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartActionBar extends StatelessWidget {
  final double totalPayment;

  const CartActionBar({super.key, required this.totalPayment});

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
              } else if (state is PaymentFailure) {
                showDialog(
                  context: context,
                  builder: (_) => PaymentStatusDialog(state: state),
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
