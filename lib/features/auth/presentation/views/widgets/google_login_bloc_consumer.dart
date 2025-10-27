import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/core/widgets/custom_nav_bar.dart';
import 'package:decor_nest/features/admin/presentation/views/screens/admin_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class GoogleLoginBlocConsumer extends StatelessWidget {
  const GoogleLoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (_, current) => current.flow == LoginFlow.google,
      buildWhen: (_, current) => current.flow == LoginFlow.google,
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.showToast(
            message: 'Login Success',
            type: ToastificationType.success,
          );

          context.go(
            state.isAdmin ? AdminDashboardScreen.path : CustomNavBar.path,
          );
        } else if (state is LoginFailure) {
          context.showToast(
            message: state.message,
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Sign In With Google',
          icon: Assets.iconsGoogle,
          color: context.surfaceColor,
          textColor: context.textColor,
          isLoading: state is LoginLoading,
          onPressed: () async =>
              await context.read<LoginCubit>().logInWithGoogle(),
        );
      },
    );
  }
}
