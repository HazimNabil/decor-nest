import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeUsernameDialog extends StatefulWidget {
  const ChangeUsernameDialog({super.key});

  @override
  State<ChangeUsernameDialog> createState() => _ChangeUsernameDialogState();
}

class _ChangeUsernameDialogState extends State<ChangeUsernameDialog> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: AlertDialog(
        backgroundColor: context.backgroundColor,
        title: Text('Change Username', style: AppStyles.medium20(context)),
        content: CustomTextField(
          hint: 'Enter your new username',
          validator: (input) => input.validateRequired('username'),
          onSaved: (input) => _username = input!.trim(),
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
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
            child: Text('Change', style: AppStyles.semiBold16(context)),
          ),
        ],
      ),
    );
  }
}
