import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/auth/data/repos/auth_repo_impl.dart';
import 'package:decor_nest/features/auth/presentation/views/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/auth/presentation/view_models/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  static const path = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(locator<AuthRepoImpl>()),
        child: const SafeArea(child: LoginScreenBody()),
      ),
    );
  }
}
