import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo_impl.dart';
import 'package:decor_nest/features/admin/presentation/view_models/edit_product_cubit/edit_product_cubit.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/edit_product_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductScreen extends StatelessWidget {
  static const path = '/edit_product';
  final Product product;

  const EditProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Product'),
      body: BlocProvider(
        create: (_) => EditProductCubit(locator<AdminRepoImpl>()),
        child: EditProductScreenBody(product: product),
      ),
    );
  }
}
