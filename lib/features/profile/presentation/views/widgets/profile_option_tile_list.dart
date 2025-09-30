import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/profile/data/repos/profile_repo_impl.dart';
import 'package:decor_nest/features/profile/presentation/view_models/logout_cubit/logout_cubit.dart';
import 'package:decor_nest/features/profile/presentation/view_models/profile_data_cubit/profile_data_cubit.dart';
import 'package:decor_nest/features/profile/presentation/view_models/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/change_email_dialog.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/change_password_dialog.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/change_username_dialog.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/profile_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileOptionTileList extends StatelessWidget {
  const ProfileOptionTileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ProfileOptionTile(
          title: 'Change Username',
          icon: Icons.person_outline,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) {
                return BlocProvider(
                  create: (_) => ProfileEditCubit(locator<ProfileRepoImpl>()),
                  child: const ChangeUsernameDialog(),
                );
              },
            ).then((state) {
              if (context.mounted && state is ProfileEditSuccess) {
                context.read<ProfileDataCubit>().emitUser();
              }
            });
          },
        ),
        ProfileOptionTile(
          title: 'Change Email',
          icon: Icons.email_outlined,
          onTap: () => showDialog(
            context: context,
            builder: (_) {
              return BlocProvider(
                create: (_) => ProfileEditCubit(locator<ProfileRepoImpl>()),
                child: const ChangeEmailDialog(),
              );
            },
          ),
        ),
        ProfileOptionTile(
          title: 'Change Password',
          icon: Icons.lock_outline,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) {
                return BlocProvider(
                  create: (_) => ProfileEditCubit(locator<ProfileRepoImpl>()),
                  child: const ChangePasswordDialog(),
                );
              },
            ).then((state) async {
              if (context.mounted && state is ProfileEditSuccess) {
                await context.read<LogoutCubit>().logOut();
              }
            });
          },
        ),
      ],
    );
  }
}
