import 'package:decor_nest/features/auth/data/models/login_input_data.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _supabaseAuth = Supabase.instance.client.auth;
  final _googleSignIn = GoogleSignIn();

  User? get currentUser => _supabaseAuth.currentUser;

  Future<User?> logIn(LoginInputData loginInputData) async {
    final response = await _supabaseAuth.signInWithPassword(
      email: loginInputData.email!,
      password: loginInputData.password!,
    );
    return response.user;
  }

  Future<void> signUp(SignUpInputData signUpInputData) async {
    await _supabaseAuth.signUp(
      email: signUpInputData.email!,
      password: signUpInputData.password!,
      data: {'username': signUpInputData.username!},
    );
  }

  Future<User?> logInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    final googleAuth = await googleUser?.authentication;
    final accessToken = googleAuth?.accessToken;
    final idToken = googleAuth?.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    final response = await _supabaseAuth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    return response.user;
  }

  Future<void> logOut() async {
    await _googleSignIn.disconnect();
    await _supabaseAuth.signOut();
  }

  Future<void> resetPassword(String email) async {
    await _supabaseAuth.resetPasswordForEmail(email);
  }
}
