import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorites_screen_app_bar.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorites_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/favorites/presentation/view_models/favorites_cubit/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FavoritesScreenAppBar(),
      body: BlocProvider(
        create: (context) => FavoritesCubit(locator<FavoritesRepoImpl>()),
        child: const FavoritesScreenBody(),
      ),
    );
  }
}
