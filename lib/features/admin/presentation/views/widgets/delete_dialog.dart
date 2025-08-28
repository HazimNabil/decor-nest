import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/admin/presentation/view_models/delete_product_cubit/delete_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class DeleteDialog extends StatelessWidget {
  final Product product;

  const DeleteDialog({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteProductCubit, DeleteProductState>(
      listener: (context, state) {
        switch (state) {
          case DeleteProductLoading():
            showDialog(
              context: context,
              builder: (_) => Center(
                child: CircularProgressIndicator(color: context.primaryColor),
              ),
            );
          case DeleteProductSuccess():
            context.pop();
            context.showToast(
              message: 'Product deleted successfully',
              type: ToastificationType.success,
            );
            context.pop();
          case DeleteProductFailure(:final message):
            context.pop();
            context.showToast(message: message, type: ToastificationType.error);
          default:
        }
      },
      child: AlertDialog(
        backgroundColor: context.surfaceColor,
        title: Text('Delete Product', style: AppStyles.medium20(context)),
        content: Text(
          'Are you sure you want to delete this product? This action CANNOT be undone.',
          style: AppStyles.regular14(context),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Cancel', style: AppStyles.medium14(context)),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await context.read<DeleteProductCubit>().deleteProduct(product);
            },
            child: Text('Delete', style: AppStyles.semiBold16(context)),
          ),
        ],
      ),
    );
  }
}
