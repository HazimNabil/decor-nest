import 'package:decor_nest/features/auth/data/models/login_input_data.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:decor_nest/core/helper/typedefs.dart';

abstract interface class AuthRepo {
  bool get isLoggedIn;
  bool get isAdmin;
  FutureEither<User> logIn(LoginInputData loginInputData);
  FutureEither<Unit> signUp(SignUpInputData signUpInputData);
  FutureEither<Unit> logOut();
  FutureEither<Unit> resetPassword(String email);
}
