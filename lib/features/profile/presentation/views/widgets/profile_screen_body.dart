import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:decor_nest/core/constants/auth_constants.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/profile/presentation/view_models/profile_data_cubit/profile_data_cubit.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/profile_option_tile_list.dart';
import 'package:decor_nest/features/profile/presentation/views/widgets/theme_segmented_button.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Center(
        child: Column(
          children: [
            BlocSelector<ProfileDataCubit, User?, String>(
              selector: (state) => state!.userMetadata![UserConstants.username],
              builder: (context, username) {
                return Text(username, style: AppStyles.medium20(context));
              },
            ),
            const SizedBox(height: 2),
            BlocSelector<ProfileDataCubit, User?, String>(
              selector: (state) => state!.email!,
              builder: (context, email) {
                return Text(email, style: AppStyles.regular14(context));
              },
            ),
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
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
