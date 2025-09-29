import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeUsernameDialog extends StatelessWidget {
  const ChangeUsernameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.backgroundColor,
      title: Text('Change Username', style: AppStyles.medium20(context)),
      content: const CustomTextField(hint: 'Enter your new username'),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text('Cancel', style: AppStyles.medium14(context)),
        ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: context.primaryColor),
          onPressed: () {},
          child: Text('Change', style: AppStyles.semiBold16(context)),
        ),
      ],
    );
  }
}
