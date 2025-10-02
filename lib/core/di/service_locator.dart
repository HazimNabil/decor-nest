import 'package:decor_nest/core/services/database_service.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo_impl.dart';
import 'package:decor_nest/features/admin/data/services/storage_service.dart';
import 'package:decor_nest/features/auth/data/repos/auth_repo_impl.dart';
import 'package:decor_nest/features/auth/data/services/auth_service.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo_impl.dart';
import 'package:decor_nest/features/cart/data/services/payment_service.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:decor_nest/features/home/data/repos/home_repo_impl.dart';
import 'package:decor_nest/features/profile/data/repos/profile_repo_impl.dart';
import 'package:decor_nest/features/profile/data/services/profile_service.dart';
import 'package:decor_nest/features/search/data/repos/search_repo_impl.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthService());

  locator.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(locator<AuthService>()),
  );

  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());

  locator.registerLazySingleton<StorageService>(() => StorageService());

  locator.registerLazySingleton<AdminRepoImpl>(
    () => AdminRepoImpl(locator<DatabaseService>(), locator<StorageService>()),
  );

  locator.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(locator<DatabaseService>()),
  );

  locator.registerLazySingleton<FavoritesRepoImpl>(
    () => FavoritesRepoImpl(locator<DatabaseService>()),
  );

  locator.registerLazySingleton<CartRepoImpl>(
    () => CartRepoImpl(locator<DatabaseService>()),
  );

  locator.registerLazySingleton<SearchRepoImpl>(
    () => SearchRepoImpl(locator<DatabaseService>()),
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
}
