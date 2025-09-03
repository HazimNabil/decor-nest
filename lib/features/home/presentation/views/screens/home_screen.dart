import 'package:decor_nest/features/home/presentation/views/widgets/home_screen_app_bar.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeScreenAppBar(),
      body: HomeScreenBody(),
    );
  }
}
