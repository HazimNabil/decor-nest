import 'package:decor_nest/core/di/service_locator.dart';
import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:decor_nest/decor_nest.dart';
import 'package:device_preview/device_preview.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:decor_nest/core/helper/app_secrets.dart';

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
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const DecorNest(),
    ),
  );
}
