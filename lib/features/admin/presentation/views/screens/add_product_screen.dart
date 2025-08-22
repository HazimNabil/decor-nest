import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  static const path = '/add_product';

  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Add Product'),
      body: Center(child: Text('Add Product')),
    );
  }
}
