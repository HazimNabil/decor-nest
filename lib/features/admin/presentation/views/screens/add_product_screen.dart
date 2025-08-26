import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo_impl.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/add_product_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_nest/features/admin/presentation/view_models/add_product_cubit/add_product_cubit.dart';

class AddProductScreen extends StatelessWidget {
  static const path = '/add_product';

  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(locator<AdminRepoImpl>()),
        child: const AddProductScreenBody(),
      ),
    );
  }
}
