import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:decor_nest/features/cart/presentation/view_models/payment_cubit/payment_cubit.dart';

class PaymentStatusDialog extends StatelessWidget {
  final PaymentState state;

  const PaymentStatusDialog({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final isSuccess = state is PaymentSuccess;
    return AlertDialog(
      title: Text(
        isSuccess ? 'Payment Successful' : 'Payment Failed',
        style: AppStyles.medium20(
          context,
        ).copyWith(color: isSuccess ? context.primaryColor : Colors.red),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Icon(
            isSuccess ? Icons.check_circle : Icons.error,
            color: isSuccess ? context.primaryColor : Colors.red,
            size: 56,
          ),
          const SizedBox(height: 16),
          Text(
            isSuccess
                ? 'Payment has been successfully processed.'
                : (state as PaymentFailure).message,
            style: AppStyles.regular16(
              context,
            ).copyWith(color: context.textColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'OK',
            color: isSuccess ? context.primaryColor : Colors.red,
            onPressed: context.pop,
          ),
        ],
      ),
    );
  }
}
