import 'package:decor_nest/features/profile/presentation/views/widgets/change_email_dialog.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/change_password_dialog.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/change_username_dialog.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/profile_option_tile.dart';
import 'package:flutter/material.dart';

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
          onTap: () => showDialog(
            context: context,
            builder: (_) => const ChangeUsernameDialog(),
          ),
        ),
        ProfileOptionTile(
          title: 'Change Email',
          icon: Icons.email_outlined,
          onTap: () => showDialog(
            context: context,
            builder: (_) => const ChangeEmailDialog(),
          ),
        ),
        ProfileOptionTile(
          title: 'Change Password',
          icon: Icons.lock_outline,
          onTap: () => showDialog(
            context: context,
            builder: (_) => const ChangePasswordDialog(),
          ),
        ),
      ],
    );
  }
}
