import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/helper/app_secrets.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/helper/custom_bloc_observer.dart';
import 'package:decor_nest/decor_nest.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc;
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
  Bloc.observer = CustomBlocObserver();
  runApp(
    DevicePreview(
      // ignore: avoid_redundant_argument_values
      enabled: !kReleaseMode,
      builder: (context) => const DecorNest(),
    ),
  );
}
