import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CartScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 20),
          onPressed: context.pop,
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: context.surfaceColor,
            fixedSize: const Size(48, 48),
          ),
        ),
        title: Text('Cart', style: AppStyles.medium20(context)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              Assets.iconsTrash,
              colorFilter: ColorFilter.mode(context.textColor, BlendMode.srcIn),
            ),
            onPressed: () => context.read<CartCubit>().clearCart(),
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
