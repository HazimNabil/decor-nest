import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/edit_product_screen_body.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatelessWidget {
  static const path = '/edit_product';
  final Product product;

  const EditProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Product'),
      body: EditProductScreenBody(product: product),
    );
  }
}
