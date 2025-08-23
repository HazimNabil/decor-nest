import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo_impl.dart';
import 'package:decor_nest/features/admin/presentation/view_models/read_products_bloc/read_products_bloc.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/admin_dashboard_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDashboardScreen extends StatelessWidget {
  static const path = '/admin_dashboard';

  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return ReadProductsBloc(locator<AdminRepoImpl>())
              ..add(const ProductsFetched());
          },
          child: const AdminDashboardScreenBody(),
        ),
      ),
    );
  }
}
