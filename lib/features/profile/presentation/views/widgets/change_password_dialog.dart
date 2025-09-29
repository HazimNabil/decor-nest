import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: AlertDialog(
        backgroundColor: context.backgroundColor,
        title: Text('Change Password', style: AppStyles.medium20(context)),
        content: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              hint: 'Enter your new password',
              validator: (input) => input.validatePassword(),
              onChanged: (input) => _password = input.trim(),
            ),
            CustomTextField(
              hint: 'Confirm your new password',
              validator: (input) => input.validateConfirmPassword(_password),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Cancel', style: AppStyles.medium14(context)),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: context.primaryColor,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            child: Text('Change', style: AppStyles.semiBold16(context)),
          ),
        ],
      ),
    );
  }
}
