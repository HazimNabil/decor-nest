import 'package:decor_nest/core/errors/auth_failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/features/profile/data/repos/profile_repo.dart';
import 'package:decor_nest/features/profile/data/services/profile_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileService _profileService;

  ProfileRepoImpl(this._profileService);

  @override
  User get currentUser => _profileService.currentUser;

  @override
  FutureEither<Unit> changeUsername(String username) async {
    return await _guard(
      () async => await _profileService.changeUsername(username),
    );
  }

  @override
  FutureEither<Unit> changeEmail(String email) async {
    return await _guard(() async => await _profileService.changeEmail(email));
  }

  @override
  FutureEither<Unit> changePassword(String password) async {
    return await _guard(
      () async => await _profileService.changePassword(password),
    );
  }

  @override
  FutureEither<Unit> logOut() async {
    return await _guard(() async => await _profileService.logOut());
  }

  FutureEither<Unit> _guard(Future<void> Function() request) async {
    try {
      await request();
      return right(unit);
    } on AuthException catch (e) {
      return left(AuthFailure.fromException(e));
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }
}
