import 'package:decor_nest/features/auth/data/models/login_input_data.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';
import 'package:fpdart/fpdart.dart' show Unit;
import 'package:decor_nest/core/helper/typedefs.dart';

abstract interface class AuthRepo {
  bool get isLoggedIn;
  bool get isAdmin;
  FutureEither<bool> logIn(LoginInputData loginInputData);
  FutureEither<bool> logInWithGoogle();
  FutureEither<Unit> signUp(SignUpInputData signUpInputData);
}
