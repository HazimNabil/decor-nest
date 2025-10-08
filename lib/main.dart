import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/helper/app_secrets.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/helper/custom_bloc_observer.dart';
import 'package:decor_nest/core/view_models/theme_cubit.dart';
import 'package:decor_nest/core/view_models/internet_connection_cubit.dart';
import 'package:decor_nest/decor_nest.dart';
import 'package:decor_nest/features/cart/data/services/payment_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    CacheHelper.init(),
    Supabase.initialize(
      url: AppSecrets.supabaseUrl,
      anonKey: AppSecrets.supabaseAnonKey,
    ),
  ]);
  setupServiceLocator();
  await locator.isReady<PaymentService>();
  Bloc.observer = CustomBlocObserver();
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
