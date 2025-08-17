import 'package:decor_nest/features/auth/presentation/views/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/auth/data/repos/auth_repo_impl.dart';

class SignUpScreen extends StatelessWidget {
  static const path = '/sign_up';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(locator<AuthRepoImpl>()),
        child: const SafeArea(child: SignUpScreenBody()),
      ),
    );
  }
}
