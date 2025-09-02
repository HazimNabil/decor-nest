import 'package:decor_nest/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppBar(
        leading: FilledButton(
          onPressed: context.pop,
          style: FilledButton.styleFrom(
            backgroundColor: context.surfaceColor,
            foregroundColor: context.textColor,
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
          ),
          child: const Icon(Icons.arrow_back),
        ),
        title: Text(title, style: AppStyles.medium20(context)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
