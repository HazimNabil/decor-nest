import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/cart/presentation/view_models/clear_cart_cubit/clear_cart_cubit.dart';
import 'package:toastification/toastification.dart';

class ClearDialog extends StatelessWidget {
  const ClearDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClearCartCubit, ClearCartState>(
      listener: (context, state) {
        switch (state) {
          case ClearCartLoading():
            showDialog(
              context: context,
              builder: (_) => Center(
                child: CircularProgressIndicator(color: context.primaryColor),
              ),
            );
          case ClearCartFailure(:final message):
            context.pop();
            context.showToast(message: message, type: ToastificationType.error);
          case ClearCartSuccess():
            context.pop();
            context.pop();
          default:
        }
      },
      child: AlertDialog(
        backgroundColor: context.surfaceColor,
        title: Text('Clear Cart', style: AppStyles.medium20(context)),
        content: Text(
          'Are you sure you want to clear your cart? This action CANNOT be undone.',
          style: AppStyles.regular14(context),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Cancel', style: AppStyles.medium14(context)),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async =>
                await context.read<ClearCartCubit>().clearCart(),
            child: Text('Clear', style: AppStyles.semiBold16(context)),
          ),
        ],
      ),
    );
  }
}
