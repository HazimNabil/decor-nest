import 'package:decor_nest/core/constants/auth_constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  final _supabaseAuth = Supabase.instance.client.auth;
  final _googleSignIn = GoogleSignIn();

  User get currentUser => _supabaseAuth.currentUser!;

  Future<void> changeUsername(String username) async {
    await _supabaseAuth.updateUser(
      UserAttributes(data: {UserConstants.username: username}),
    );
  }

  Future<void> changeEmail(String email) async {
    await _supabaseAuth.updateUser(UserAttributes(email: email));
  }

  Future<void> changePassword(String password) async {
    await _supabaseAuth.updateUser(UserAttributes(password: password));
  }

  Future<void> logOut() async {
    await _googleSignIn.signOut();
    await _supabaseAuth.signOut();
  }
}
