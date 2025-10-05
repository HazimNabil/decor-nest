import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/orders/presentation/views/screens/order_history_screen.dart';
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
import 'package:go_router/go_router.dart';

class ProfileOptionTileList extends StatelessWidget {
  const ProfileOptionTileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ProfileOptionTile(
          title: 'Order History',
          icon: Icons.receipt_long_outlined,
          onTap: () => context.push(OrderHistoryScreen.path),
        ),
        ProfileOptionTile(
          title: 'Change Username',
          icon: Icons.person_outline,
          onTap: () => _showProfileEditDialog(
            context: context,
            dialog: const ChangeUsernameDialog(),
            onSuccess: (context) async {
              context.read<ProfileDataCubit>().emitUser();
            },
          ),
        ),
        ProfileOptionTile(
          title: 'Change Email',
          icon: Icons.email_outlined,
          onTap: () => _showProfileEditDialog(
            context: context,
            dialog: const ChangeEmailDialog(),
            onSuccess: (context) async {
              await context.read<LogoutCubit>().logOut();
            },
          ),
        ),
        ProfileOptionTile(
          title: 'Change Password',
          icon: Icons.lock_outline,
          onTap: () => _showProfileEditDialog(
            context: context,
            dialog: const ChangePasswordDialog(),
            onSuccess: (context) async {
              await context.read<LogoutCubit>().logOut();
            },
          ),
        ),
      ],
    );
  }

  Future<void> _showProfileEditDialog({
    required BuildContext context,
    required Widget dialog,
    required Future<void> Function(BuildContext) onSuccess,
  }) async {
    final state = await showDialog(
      context: context,
      builder: (_) => BlocProvider(
        create: (_) => ProfileEditCubit(locator<ProfileRepoImpl>()),
        child: dialog,
      ),
    );

    if (context.mounted && state is ProfileEditSuccess) {
      await onSuccess(context);
    }
  }
}
