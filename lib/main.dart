import 'package:decor_nest/core/helper/app_initializer.dart';
import 'package:decor_nest/core/view_models/theme_cubit.dart';
import 'package:decor_nest/core/view_models/internet_connection_cubit.dart';
import 'package:decor_nest/decor_nest.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart' show runApp;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future<void> main() async {
  await initApp();
  runApp(
    DevicePreview(
      // ignore: avoid_redundant_argument_values
      enabled: !kReleaseMode,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ThemeCubit()),
            BlocProvider(
              create: (_) => InternetConnectionCubit(InternetConnection()),
            ),
          ],
          child: const DecorNest(),
        );
      },
    ),
  );
}
