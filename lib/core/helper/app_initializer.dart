import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/helper/app_bloc_observer.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/services/reference_data_service.dart';
import 'package:decor_nest/features/cart/data/services/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:decor_nest/core/helper/app_secrets.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    CacheHelper.init(),
    Supabase.initialize(
      url: AppSecrets.supabaseUrl,
      anonKey: AppSecrets.supabaseAnonKey,
    ),
  ]);
  setupServiceLocator();
  await Future.wait([
    locator.isReady<ReferenceDataService>(),
    locator.isReady<PaymentService>(),
  ]);
  Bloc.observer = AppBlocObserver();
}
