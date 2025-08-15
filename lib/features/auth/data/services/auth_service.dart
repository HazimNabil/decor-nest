import 'package:decor_nest/features/auth/data/models/login_input_data.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabaseAuth = Supabase.instance.client.auth;

  User? get getCurrentUser => _supabaseAuth.currentUser;

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

  Future<void> logOut() async => await _supabaseAuth.signOut();

  Future<void> resetPassword(String email) async {
    await _supabaseAuth.resetPasswordForEmail(email);
  }
}
