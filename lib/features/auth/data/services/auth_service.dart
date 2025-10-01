import 'package:decor_nest/core/constants/auth_constants.dart';
import 'package:decor_nest/core/helper/app_secrets.dart';
import 'package:decor_nest/features/auth/data/models/login_input_data.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _supabaseAuth = Supabase.instance.client.auth;
  final _googleSignIn = GoogleSignIn(serverClientId: AppSecrets.webClientId);

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
      data: {
        UserConstants.username: signUpInputData.username!,
        UserConstants.role: UserConstants.user,
      },
    );
  }

  Future<User?> logInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception(AuthErrors.googleAccountNotSelected);
    }

    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw Exception(AuthErrors.googleAccessTokenNotFound);
    }
    if (idToken == null) {
      throw Exception(AuthErrors.googleIdTokenNotFound);
    }

    final response = await _supabaseAuth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    return response.user;
  }
}
