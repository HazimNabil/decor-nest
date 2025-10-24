import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/auth/presentation/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/profile/presentation/view_models/logout_cubit/logout_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class AdminDashboardHeader extends StatelessWidget {
  const AdminDashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        switch (state) {
          case LogoutSuccess():
            context.pop();
            context.go(LoginScreen.path);
          case LogoutLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          case LogoutFailure(:final String message):
            context.pop();
            context.showToast(message: message, type: ToastificationType.error);
          default:
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Products', style: AppStyles.semiBold32(context)),
              Text('Manage your products', style: AppStyles.regular16(context)),
            ],
          ),
          IconButton(
            color: Colors.red,
            iconSize: 32,
            icon: const Icon(Icons.logout),
            onPressed: () async => await context.read<LogoutCubit>().logOut(),
          ),
        ],
      ),
    );
  }
}
