import 'package:decor_nest/core/constants/auth_constants.dart';
import 'package:decor_nest/core/errors/auth_failure.dart';
import 'package:decor_nest/core/errors/failure.dart';
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

    final role = _authService.currentUser!.userMetadata?[UserConstants.role];
    return (role == UserConstants.admin);
  }

  @override
  FutureEither<bool> logIn(LoginInputData loginInputData) async {
    return _sendRequest(() async {
      await _authService.logIn(loginInputData);
      return isAdmin;
    });
  }

  @override
  FutureEither<Unit> signUp(SignUpInputData signUpInputData) async {
    return _sendRequest(() async {
      await _authService.signUp(signUpInputData);
      return unit;
    });
  }

  @override
  FutureEither<bool> logInWithGoogle() async {
    return _sendRequest(() async {
      await _authService.logInWithGoogle();
      return isAdmin;
    });
  }

  FutureEither<T> _sendRequest<T>(Future<T> Function() request) async {
    try {
      final response = await request();
      return right(response);
    } on AuthException catch (e) {
      return left(AuthFailure.fromException(e));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
