import 'package:flutter/material.dart' show runApp;
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:decor_nest/decor_nest.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const DecorNest(),
    ),
  );
}
