import 'package:decor_nest/core/services/database_service.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo_impl.dart';
import 'package:decor_nest/features/admin/data/services/storage_service.dart';
import 'package:decor_nest/features/auth/data/repos/auth_repo_impl.dart';
import 'package:decor_nest/features/auth/data/services/auth_service.dart';
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
}
