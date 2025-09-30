import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:decor_nest/features/profile/presentation/view_models/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:toastification/toastification.dart';

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
    return BlocListener<ProfileEditCubit, ProfileEditState>(
      listener: (context, state) {
        switch (state) {
          case ProfileEditLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          case ProfileEditSuccess():
            context.pop();
            context.showToast(
              message: 'Username changed successfully',
              type: ToastificationType.success,
            );
            context.pop(state);
          case ProfileEditFailure(:final message):
            context.pop();
            context.showToast(message: message, type: ToastificationType.error);
          default:
        }
      },
      child: Form(
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await context.read<ProfileEditCubit>().changeUsername(
                    _username,
                  );
                }
              },
              child: Text('Change', style: AppStyles.semiBold16(context)),
            ),
          ],
        ),
      ),
    );
  }
}
