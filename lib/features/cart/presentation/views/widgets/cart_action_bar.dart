import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/cart/data/models/payment_request.dart';
import 'package:decor_nest/features/cart/presentation/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            listener: (context, state) {
              if (state is PaymentSuccess) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Payment Successful',
                      style: AppStyles.medium20(
                        context,
                      ).copyWith(color: context.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        Icon(
                          Icons.check_circle,
                          color: context.primaryColor,
                          size: 56,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Payment has been successfully processed.',
                          style: AppStyles.regular16(
                            context,
                          ).copyWith(color: context.textColor),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          text: 'OK',
                          color: context.primaryColor,
                          onPressed: () => context.pop(),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is PaymentFailure) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Payment Failed',
                      style: AppStyles.medium20(
                        context,
                      ).copyWith(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        const Icon(Icons.error, color: Colors.red, size: 56),
                        const SizedBox(height: 16),
                        Text(
                          state.message,
                          style: AppStyles.regular16(
                            context,
                          ).copyWith(color: context.textColor),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          text: 'OK',
                          color: Colors.red,
                          onPressed: () => context.pop(),
                        ),
                      ],
                    ),
                  ),
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
