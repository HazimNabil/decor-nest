import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeEmailDialog extends StatefulWidget {
  const ChangeEmailDialog({super.key});

  @override
  State<ChangeEmailDialog> createState() => _ChangeEmailDialogState();
}

class _ChangeEmailDialogState extends State<ChangeEmailDialog> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: AlertDialog(
        backgroundColor: context.backgroundColor,
        title: Text('Change Email', style: AppStyles.medium20(context)),
        content: CustomTextField(
          hint: 'Enter your new email',
          validator: (input) => input.validateEmail(),
          onSaved: (input) => _email = input!.trim(),
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
