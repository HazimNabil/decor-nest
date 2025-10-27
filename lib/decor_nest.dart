import 'package:decor_nest/core/widgets/offline_screen.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/core/themes/app_themes.dart';
import 'package:decor_nest/core/router/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/core/view_models/theme_cubit.dart';
import 'package:decor_nest/core/view_models/internet_connection_cubit.dart';

class DecorNest extends StatefulWidget {
  const DecorNest({super.key});

  @override
  State<DecorNest> createState() => _DecorNestState();
}

class _DecorNestState extends State<DecorNest> {
  bool _wasOffline = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetConnectionCubit, bool?>(
      listener: (context, isConnected) {
        if (isConnected == false) {
          _wasOffline = true;
          AppRouter.router.push(OfflineScreen.path);
        } else if (isConnected == true && _wasOffline) {
          _wasOffline = false;
          AppRouter.router.pop();
        }
      },
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: themeMode,
            themeAnimationDuration: const Duration(seconds: 1),
            themeAnimationCurve: Curves.fastOutSlowIn,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
