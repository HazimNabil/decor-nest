import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/profile/data/repos/profile_repo_impl.dart';
import 'package:decor_nest/features/profile/presentation/view_models/logout_cubit/logout_cubit.dart';
import 'package:decor_nest/features/profile/presentation/view_models/profile_data_cubit/profile_data_cubit.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) {
                return ProfileDataCubit(locator<ProfileRepoImpl>())..emitUser();
              },
            ),
            BlocProvider(
              create: (context) => LogoutCubit(locator<ProfileRepoImpl>()),
            ),
          ],
          child: const ProfileScreenBody(),
        ),
      ),
    );
  }
}
