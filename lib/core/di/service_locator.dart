import 'package:decor_nest/features/admin/data/repos/admin_repo_impl.dart';
import 'package:decor_nest/features/admin/data/services/storage_service.dart';
import 'package:decor_nest/features/auth/data/repos/auth_repo_impl.dart';
import 'package:decor_nest/features/auth/data/services/auth_service.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo_impl.dart';
import 'package:decor_nest/features/cart/data/services/payment_service.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:decor_nest/features/home/data/repos/home_repo_impl.dart';
import 'package:decor_nest/features/orders/data/repos/orders_repo_impl.dart';
import 'package:decor_nest/features/profile/data/repos/profile_repo_impl.dart';
import 'package:decor_nest/features/profile/data/services/profile_service.dart';
import 'package:decor_nest/features/search/data/repos/search_repo_impl.dart';
import 'package:decor_nest/features/admin/data/services/admin_database_service.dart';
import 'package:decor_nest/features/cart/data/services/cart_database_service.dart';
import 'package:decor_nest/features/favorites/data/services/favorites_database_service.dart';
import 'package:decor_nest/features/home/data/services/home_database_service.dart';
import 'package:decor_nest/features/orders/data/services/orders_database_service.dart';
import 'package:decor_nest/features/search/data/services/search_database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthService());

  locator.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(locator<AuthService>()),
  );

  locator.registerLazySingleton<AdminDatabaseService>(
    () => AdminDatabaseService(Supabase.instance.client),
  );

  locator.registerLazySingleton<HomeDatabaseService>(
    () => HomeDatabaseService(Supabase.instance.client),
  );

  locator.registerLazySingleton<CartDatabaseService>(
    () => CartDatabaseService(Supabase.instance.client),
  );

  locator.registerLazySingleton<FavoritesDatabaseService>(
    () => FavoritesDatabaseService(Supabase.instance.client),
  );

  locator.registerLazySingleton<SearchDatabaseService>(
    () => SearchDatabaseService(Supabase.instance.client),
  );

  locator.registerLazySingleton<OrdersDatabaseService>(
    () => OrdersDatabaseService(Supabase.instance.client),
  );

  locator.registerLazySingleton<StorageService>(() => StorageService());

  locator.registerLazySingleton<AdminRepoImpl>(
    () => AdminRepoImpl(
      locator<AdminDatabaseService>(),
      locator<StorageService>(),
    ),
  );

  locator.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(locator<HomeDatabaseService>()),
  );

  locator.registerLazySingleton<FavoritesRepoImpl>(
    () => FavoritesRepoImpl(locator<FavoritesDatabaseService>()),
  );

  locator.registerLazySingleton<CartRepoImpl>(
    () => CartRepoImpl(locator<CartDatabaseService>()),
  );

  locator.registerLazySingleton<SearchRepoImpl>(
    () => SearchRepoImpl(locator<SearchDatabaseService>()),
  );

  locator.registerLazySingleton<ProfileService>(() => ProfileService());

  locator.registerLazySingleton<ProfileRepoImpl>(
    () => ProfileRepoImpl(locator<ProfileService>()),
  );

  locator.registerSingletonAsync<PaymentService>(() async {
    final paymobService = PaymentService();
    await paymobService.init();
    return paymobService;
  });

  locator.registerLazySingleton<OrdersRepoImpl>(
    () => OrdersRepoImpl(locator<OrdersDatabaseService>()),
  );

  locator.registerSingleton(InternetConnection());
}
