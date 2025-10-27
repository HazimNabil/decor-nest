import 'package:decor_nest/core/errors/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show AuthException;
import 'package:decor_nest/core/constants/auth_constants.dart';

class AuthFailure extends Failure {
  const AuthFailure(super.message);

  factory AuthFailure.fromException(AuthException e) {
    return switch (e.code) {
      AuthCodes.invalidCredentials => const AuthFailure(
        AuthErrors.invalidCredentials,
      ),
      AuthCodes.emailNotConfirmed => const AuthFailure(
        AuthErrors.emailNotConfirmed,
      ),
      AuthCodes.userNotFound => const AuthFailure(AuthErrors.userNotFound),

      AuthCodes.userAlreadyExists => const AuthFailure(
        AuthErrors.userAlreadyExists,
      ),
      AuthCodes.weakPassword => const AuthFailure(AuthErrors.weakPassword),

      _ => AuthFailure(e.message),
    };
  }
}
