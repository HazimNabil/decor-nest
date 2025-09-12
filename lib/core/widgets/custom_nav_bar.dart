import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/features/favorites/presentation/views/screens/favorites_screen.dart';
import 'package:decor_nest/features/home/data/repos/home_repo_impl.dart';
import 'package:decor_nest/features/home/presentation/view_models/fetch_products_bloc/fetch_products_bloc.dart';
import 'package:decor_nest/features/home/presentation/views/screens/home_screen.dart';
import 'package:decor_nest/features/profile/presentation/views/screens/profile_screen.dart';
import 'package:decor_nest/features/search/presentation/views/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomNavBar extends StatefulWidget {
  static const path = '/nav_bar';

  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _items,
      backgroundColor: context.surfaceColor,
    );
  }

  List<Widget> get _screens => [
    BlocProvider(
      create: (context) {
        return FetchProductsBloc(locator<HomeRepoImpl>())
          ..add(const ProductsFetched());
      },
      child: const HomeScreen(),
    ),
    const FavoritesScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  List<PersistentBottomNavBarItem> get _items => [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.iconsSelectedHome),
      inactiveIcon: SvgPicture.asset(Assets.iconsUnselectedHome),
      title: 'Home',
      activeColorPrimary: context.primaryColor,
      activeColorSecondary: context.primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.iconsSelectedFavorites),
      inactiveIcon: SvgPicture.asset(Assets.iconsUnselectedFavorites),
      title: 'Favorites',
      activeColorPrimary: context.primaryColor,
      activeColorSecondary: context.primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.iconsSelectedSearch),
      inactiveIcon: SvgPicture.asset(Assets.iconsUnselectedSearch),
      title: 'Search',
      activeColorPrimary: context.primaryColor,
      activeColorSecondary: context.primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.iconsSelectedProfile),
      inactiveIcon: SvgPicture.asset(Assets.iconsUnselectedProfile),
      title: 'Profile',
      activeColorPrimary: context.primaryColor,
      activeColorSecondary: context.primaryColor,
    ),
  ];
}
