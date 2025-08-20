class AuthCodes {
  const AuthCodes._();

  static const invalidCredentials = 'invalid_credentials';
  static const emailNotConfirmed = 'email_not_confirmed';
  static const userNotFound = 'user_not_found';
  static const userAlreadyExists = 'user_already_exists';
  static const weakPassword = 'weak_password';
}

class AuthErrors {
  const AuthErrors._();

  static const invalidCredentials = 'Incorrect email or password.';
  static const emailNotConfirmed =
      'Please verify your email. We\'ve sent you a verification link.';
  static const userNotFound = 'We couldn\'t find an account with this email.';
  static const userAlreadyExists =
      'This email is already in use. Try logging in or reset your password.';
  static const weakPassword =
      'Your password is too weak. Use at least 8 characters';
}
