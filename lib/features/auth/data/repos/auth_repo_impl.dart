import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/errors/auth_failure.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/features/auth/data/models/login_input_data.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';
import 'package:decor_nest/features/auth/data/repos/auth_repo.dart';
import 'package:decor_nest/features/auth/data/services/auth_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthService _authService;

  const AuthRepoImpl(this._authService);

  @override
  bool get isLoggedIn => (_authService.currentUser != null);

  @override
  bool get isAdmin {
    if (!isLoggedIn) return false;
    return (_authService.currentUser!.userMetadata?['role'] == 'admin');
  }

  @override
  FutureEither<bool> logIn(LoginInputData loginInputData) async {
    try {
      final user = await _authService.logIn(loginInputData);
      await CacheHelper.setSecureData(CacheConstants.userId, user!.id);
      return right(isAdmin);
    } on AuthException catch (e) {
      return left(AuthFailure.fromException(e));
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }

  @override
  FutureEither<Unit> signUp(SignUpInputData signUpInputData) async {
    try {
      await _authService.signUp(signUpInputData);
      return right(unit);
    } on AuthException catch (e) {
      return left(AuthFailure.fromException(e));
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }

  @override
  FutureEither<bool> logInWithGoogle() async {
    try {
      final user = await _authService.logInWithGoogle();
      await CacheHelper.setSecureData(CacheConstants.userId, user!.id);
      return right(isAdmin);
    } on AuthException catch (e) {
      return left(AuthFailure.fromException(e));
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }
}
