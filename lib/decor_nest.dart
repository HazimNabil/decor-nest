import 'package:flutter/material.dart';
import 'package:decor_nest/core/themes/app_themes.dart';

class DecorNest extends StatelessWidget {
  const DecorNest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.system,
    );
  }
}
