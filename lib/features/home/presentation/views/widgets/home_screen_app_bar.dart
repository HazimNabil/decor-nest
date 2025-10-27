import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/cart/presentation/views/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Decor Nest', style: AppStyles.medium24(context)),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              Assets.iconsCart,
              colorFilter: ColorFilter.mode(context.textColor, BlendMode.srcIn),
            ),
            onPressed: () => context.push(CartScreen.path),
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: context.surfaceColor,
              fixedSize: const Size(48, 48),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
