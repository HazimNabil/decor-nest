import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ProfileRepo {
  User get currentUser;
  FutureEither<Unit> changeUsername(String username);
  FutureEither<Unit> changeEmail(String email);
  FutureEither<Unit> changePassword(String password);
  FutureEither<Unit> logOut();
}
