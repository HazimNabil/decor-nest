import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/profile/data/repos/profile_repo_impl.dart';
import 'package:decor_nest/features/profile/presentation/view_models/logout_cubit/logout_cubit.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/profile_option_tile_list.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/theme_segmented_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Center(
            child: Column(
              children: [
                Text('John Doe', style: AppStyles.medium20(context)),
                const SizedBox(height: 2),
                Text('john.doe@gmail.com', style: AppStyles.regular14(context)),
                const SizedBox(height: 32),
                const ThemeSegmentedButton(),
                Divider(
                  color: context.subTextColor.withAlpha(100),
                  indent: 8,
                  endIndent: 8,
                  thickness: 1,
                  height: 32,
                ),
                const ProfileOptionTileList(),
                const Spacer(),
                BlocProvider(
                  create: (context) => LogoutCubit(locator<ProfileRepoImpl>()),
                  child: const LogoutButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
