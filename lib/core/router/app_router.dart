import 'package:decor_nest/features/home/data/repos/home_repo_impl.dart';
import 'package:decor_nest/features/home/presentation/view_models/fetch_products_bloc/fetch_products_bloc.dart'
    hide ProductsFetched;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
import 'package:decor_nest/features/cart/presentation/view_models/clear_cart_cubit/clear_cart_cubit.dart';
import 'package:decor_nest/features/home/presentation/views/screens/details_screen.dart';
import 'package:decor_nest/features/onboarding/presentation/views/screens/onboarding_screen.dart';
import 'package:decor_nest/features/orders/presentation/views/screens/order_history_screen.dart';
import 'package:decor_nest/features/search/data/models/product_filter.dart';
import 'package:decor_nest/features/search/data/repos/search_repo_impl.dart';
import 'package:decor_nest/features/search/presentation/view_models/search_bloc/search_bloc.dart';
import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/features/search/presentation/views/screens/filter_screen.dart';
import 'package:decor_nest/core/widgets/offline_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: OnboardingScreen.path,
        pageBuilder: (_, _) => const CupertinoPage(child: OnboardingScreen()),
      ),
      GoRoute(
        path: LoginScreen.path,
        pageBuilder: (_, _) => const CupertinoPage(child: LoginScreen()),
      ),
      GoRoute(
        path: SignUpScreen.path,
        pageBuilder: (_, _) => const CupertinoPage(child: SignUpScreen()),
      ),
      ShellRoute(
        builder: (_, _, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => SearchBloc(locator<SearchRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => FetchProductsBloc(locator<HomeRepoImpl>()),
              ),
            ],
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: CustomNavBar.path,
            pageBuilder: (_, _) => const CupertinoPage(child: CustomNavBar()),
          ),
          GoRoute(
            path: FilterScreen.path,
            pageBuilder: (_, state) {
              return CupertinoPage(
                child: FilterScreen(filter: state.extra as ProductFilter),
              );
            },
          ),
          GoRoute(
            path: CartScreen.path,
            pageBuilder: (_, _) {
              return CupertinoPage(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (_) => CartCubit(locator<CartRepoImpl>()),
                    ),
                    BlocProvider(
                      create: (_) => ClearCartCubit(locator<CartRepoImpl>()),
                    ),
                  ],
                  child: const CartScreen(),
                ),
              );
            },
          ),
          GoRoute(
            path: DetailsScreen.path,
            builder: (_, state) =>
                DetailsScreen(product: state.extra as Product),
          ),
        ],
      ),
      GoRoute(
        path: OrderHistoryScreen.path,
        pageBuilder: (_, _) => const CupertinoPage(child: OrderHistoryScreen()),
      ),
      GoRoute(
        path: OfflineScreen.path,
        pageBuilder: (_, _) => const CupertinoPage(child: OfflineScreen()),
      ),
      GoRoute(
        path: AdminDashboardScreen.path,
        pageBuilder: (_, _) {
          return CupertinoPage(
            child: BlocProvider(
              create: (_) {
                final bloc = ProductsQueryBloc(locator<AdminRepoImpl>());
                return bloc..add(const ProductsFetched());
              },
              child: const AdminDashboardScreen(),
            ),
          );
        },
      ),
      GoRoute(
        path: EditProductScreen.path,
        pageBuilder: (_, state) {
          return CupertinoPage(
            child: EditProductScreen(product: state.extra as Product),
          );
        },
      ),
      GoRoute(
        path: AddProductScreen.path,
        pageBuilder: (_, _) => const CupertinoPage(child: AddProductScreen()),
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
