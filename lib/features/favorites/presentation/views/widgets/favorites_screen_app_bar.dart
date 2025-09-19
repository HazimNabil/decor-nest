import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class FavoritesScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const FavoritesScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Favorites', style: AppStyles.medium24(context)),
      titleSpacing: 24,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
