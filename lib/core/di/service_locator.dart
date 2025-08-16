import 'package:decor_nest/features/auth/data/repos/auth_repo_impl.dart';
import 'package:decor_nest/features/auth/data/services/auth_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthService());

  locator.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(locator<AuthService>()),
  );
}
