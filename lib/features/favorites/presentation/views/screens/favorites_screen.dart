import 'package:decor_nest/features/favorites/presentation/views/widgets/favorites_screen_app_bar.dart';
import 'package:decor_nest/features/favorites/presentation/views/widgets/favorites_screen_body.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FavoritesScreenAppBar(),
      body: FavoritesScreenBody(),
    );
  }
}
