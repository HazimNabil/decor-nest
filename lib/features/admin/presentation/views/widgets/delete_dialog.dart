import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
          onPressed: () {},
          child: Text('Delete', style: AppStyles.semiBold16(context)),
        ),
      ],
    );
  }
}
