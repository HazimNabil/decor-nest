import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/product_card_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AdminProductCard extends StatelessWidget {
  const AdminProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: context.primaryColor,
            foregroundColor: context.surfaceColor,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.red,
            foregroundColor: context.surfaceColor,
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
        child: const ProductCardInfo(),
      ),
    );
  }
}
