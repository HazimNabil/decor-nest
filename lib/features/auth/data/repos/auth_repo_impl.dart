import 'package:decor_nest/core/errors/auth_failure.dart';
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
  bool get isLoggedIn => _authService.currentUser != null;

  @override
  bool get isAdmin => _authService.currentUser?.email == 'admin@gmail.com';

  @override
  FutureEither<User> logIn(LoginInputData loginInputData) async {
    try {
      final user = await _authService.logIn(loginInputData);
      return right(user!);
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
  FutureEither<User> logInWithGoogle() async {
    try {
      final user = await _authService.logInWithGoogle();
      return right(user!);
    } on AuthException catch (e) {
      return left(AuthFailure.fromException(e));
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }

  @override
  FutureEither<Unit> logOut() async {
    try {
      await _authService.logOut();
      return right(unit);
    } on AuthException catch (e) {
      return left(AuthFailure.fromException(e));
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }

  @override
  FutureEither<Unit> resetPassword(String email) async {
    try {
      await _authService.resetPassword(email);
      return right(unit);
    } on AuthException catch (e) {
      return left(AuthFailure.fromException(e));
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }
}
