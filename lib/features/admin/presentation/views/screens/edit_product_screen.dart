import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/edit_product_screen_body.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatelessWidget {
  static const path = '/edit_product';

  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Edit Product'),
      body: EditProductScreenBody(),
    );
  }
}
