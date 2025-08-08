import 'package:flutter/material.dart';
import 'package:decor_nest/core/themes/app_themes.dart';
import 'package:decor_nest/core/router/app_router.dart';

class DecorNest extends StatelessWidget {
  const DecorNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      routerConfig: AppRouter.router,
    );
  }
}
