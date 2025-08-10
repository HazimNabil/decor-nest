import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:decor_nest/decor_nest.dart';
import 'package:device_preview/device_preview.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const DecorNest(),
    ),
  );
}
