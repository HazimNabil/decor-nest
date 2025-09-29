import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/auth/presentation/views/screens/login_screen.dart';
import 'package:decor_nest/features/profile/presentation/view_models/logout_cubit/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        switch (state) {
          case LogoutSuccess():
            context.showToast(
              message: 'Logged out successfully',
              type: ToastificationType.success,
            );
            context.go(LoginScreen.path);
          case LogoutFailure(:final message):
            context.pop();
            context.showToast(message: message, type: ToastificationType.error);
          case LogoutLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          default:
        }
      },
      child: TextButton(
        onPressed: () async => await context.read<LogoutCubit>().logOut(),
        child: Text(
          'Logout',
          style: AppStyles.medium20(context).copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
