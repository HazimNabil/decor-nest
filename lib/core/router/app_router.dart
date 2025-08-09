import 'package:decor_nest/features/auth/presentation/views/screens/login_screen.dart';
import 'package:decor_nest/features/onboarding/presentation/views/screens/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: OnboardingScreen.path,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: LoginScreen.path,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}