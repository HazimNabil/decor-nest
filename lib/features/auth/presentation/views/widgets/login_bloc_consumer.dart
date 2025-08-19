import 'package:decor_nest/features/admin/presentation/views/screens/admin_dashboard_screen.dart';
import 'package:decor_nest/features/auth/data/models/login_input_data.dart';
import 'package:decor_nest/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/home/presentation/views/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class LoginBlocConsumer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidateMode;
  final LoginInputData loginInputData;

  const LoginBlocConsumer({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.loginInputData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (_, current) => current.flow == LoginFlow.email,
      buildWhen: (_, current) => current.flow == LoginFlow.email,
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.showToast(
            message: 'Login Success',
            type: ToastificationType.success,
          );
          final isAdmin = state.user.userMetadata?['role'] == 'admin';
          context.go(isAdmin ? AdminDashboardScreen.path : HomeScreen.path);
        } else if (state is LoginFailure) {
          context.showToast(
            message: state.message,
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Sign In',
          color: context.primaryColor,
          isLoading: state is LoginLoading,
          onPressed: () async => await _logIn(context),
        );
      },
    );
  }

  Future<void> _logIn(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await context.read<LoginCubit>().logIn(loginInputData);
    } else {
      autovalidateMode.value = AutovalidateMode.always;
    }
  }
}
