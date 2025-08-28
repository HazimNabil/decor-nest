import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo_impl.dart';
import 'package:decor_nest/features/admin/presentation/views/screens/edit_product_screen.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/delete_dialog.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/product_card_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:decor_nest/features/admin/presentation/view_models/delete_product_cubit/delete_product_cubit.dart';
import 'package:decor_nest/core/di/service_locator.dart';

class AdminProductCard extends StatelessWidget {
  final Product product;

  const AdminProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(product.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => context.push(EditProductScreen.path),
            backgroundColor: context.primaryColor,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: _showDeleteDialog,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.surfaceColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(14),
        child: ProductCardInfo(product: product),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider(
          create: (_) => DeleteProductCubit(locator<AdminRepoImpl>()),
          child: DeleteDialog(product: product),
        );
      },
    );
  }
}
