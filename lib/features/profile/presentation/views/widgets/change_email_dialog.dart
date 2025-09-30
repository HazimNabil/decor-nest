import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:decor_nest/features/profile/presentation/view_models/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:toastification/toastification.dart';

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
              message:
                  'Verification link sent to your new email to confirm the change',
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await context.read<ProfileEditCubit>().changeEmail(_email);
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
