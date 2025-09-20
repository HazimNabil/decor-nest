import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/custom_nav_bar.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo_impl.dart';
import 'package:decor_nest/features/admin/presentation/view_models/products_query_bloc/products_query_bloc.dart';
import 'package:decor_nest/features/admin/presentation/views/screens/add_product_screen.dart';
import 'package:decor_nest/features/admin/presentation/views/screens/admin_dashboard_screen.dart';
import 'package:decor_nest/features/admin/presentation/views/screens/edit_product_screen.dart';
import 'package:decor_nest/features/auth/data/repos/auth_repo_impl.dart';
import 'package:decor_nest/features/auth/presentation/views/screens/login_screen.dart';
import 'package:decor_nest/features/auth/presentation/views/screens/sign_up_screen.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo_impl.dart';
import 'package:decor_nest/features/cart/presentation/views/screens/cart_screen.dart';
import 'package:decor_nest/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:decor_nest/features/home/presentation/views/screens/details_screen.dart';
import 'package:decor_nest/features/onboarding/presentation/views/screens/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: OnboardingScreen.path,
        builder: (_, _) => const OnboardingScreen(),
      ),
      GoRoute(path: LoginScreen.path, builder: (_, _) => const LoginScreen()),
      GoRoute(path: SignUpScreen.path, builder: (_, _) => const SignUpScreen()),
      GoRoute(path: CustomNavBar.path, builder: (_, _) => const CustomNavBar()),
      GoRoute(
        path: DetailsScreen.path,
        builder: (_, state) {
          final product = state.extra as Product;
          return DetailsScreen(product: product);
        },
      ),
      GoRoute(
        path: CartScreen.path,
        builder: (_, _) {
          return BlocProvider(
            create: (context) => CartCubit(locator<CartRepoImpl>()),
            child: const CartScreen(),
          );
        },
      ),
      GoRoute(
        path: AdminDashboardScreen.path,
        builder: (_, _) => BlocProvider(
          create: (context) {
            final bloc = ProductsQueryBloc(locator<AdminRepoImpl>());
            return bloc..add(const ProductsFetched());
          },
          child: const AdminDashboardScreen(),
        ),
      ),
      GoRoute(
        path: EditProductScreen.path,
        builder: (_, state) {
          return EditProductScreen(product: state.extra as Product);
        },
      ),
      GoRoute(
        path: AddProductScreen.path,
        builder: (_, _) => const AddProductScreen(),
      ),
    ],
    redirect: (_, state) async {
      final isFirstTime = await CacheHelper.getBool(
        CacheConstants.isFirstTime,
        defaultValue: true,
      );

      final isLoggedIn = locator<AuthRepoImpl>().isLoggedIn;
      final isAdmin = locator<AuthRepoImpl>().isAdmin;

      if (state.matchedLocation == '/') {
        return isFirstTime ? OnboardingScreen.path : LoginScreen.path;
      }

      if (state.matchedLocation == LoginScreen.path && isLoggedIn) {
        return isAdmin ? AdminDashboardScreen.path : CustomNavBar.path;
      }

      return null;
    },
  );
}
