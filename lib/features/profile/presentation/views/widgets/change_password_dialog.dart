import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/profile/presentation/view_models/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:toastification/toastification.dart';

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
              message: 'Password changed successfully',
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
          title: Text('Change Password', style: AppStyles.medium20(context)),
          content: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                hint: 'Enter your new password',
                isPassword: true,
                validator: (input) => input.validatePassword(),
                onChanged: (input) => _password = input.trim(),
              ),
              CustomTextField(
                hint: 'Confirm your new password',
                isPassword: true,
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
                if (_formKey.currentState!.validate()) {
                  context.read<ProfileEditCubit>().changePassword(_password);
                }
              },
              child: Text(
                'Change',
                style: AppStyles.semiBold16(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
