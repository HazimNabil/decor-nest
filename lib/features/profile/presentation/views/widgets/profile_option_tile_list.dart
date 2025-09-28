import 'package:decor_nest/features/profile/presentation/views/widgets/profile_option_tile.dart';
import 'package:flutter/material.dart';

class ProfileOptionTileList extends StatelessWidget {
  const ProfileOptionTileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_profileOptions.length, (index) {
        final (title, icon) = _profileOptions[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ProfileOptionTile(title: title, icon: icon),
        );
      }),
    );
  }

  List<(String, IconData)> get _profileOptions {
    return [
      ('Change Username', Icons.person_outline),
      ('Change Email', Icons.email_outlined),
      ('Change Password', Icons.lock_outline),
      ('Settings', Icons.settings_outlined),
    ];
  }
}
