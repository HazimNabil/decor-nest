import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/home/data/repos/home_repo_impl.dart';
import 'package:decor_nest/features/home/presentation/view_models/fetch_products_bloc/fetch_products_bloc.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/home_screen_app_bar.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      body: BlocProvider(
        create: (context) {
          return FetchProductsBloc(locator<HomeRepoImpl>())
            ..add(const ProductsFetched());
        },
        child: const HomeScreenBody(),
      ),
    );
  }
}
