import 'package:flutter/material.dart';
import 'package:decor_nest/core/themes/app_themes.dart';
import 'package:decor_nest/core/router/app_router.dart';
import 'package:device_preview/device_preview.dart';

class DecorNest extends StatelessWidget {
  const DecorNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
    );
  }
}
