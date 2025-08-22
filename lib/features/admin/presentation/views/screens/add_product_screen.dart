import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  static const path = '/add_product';

  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Add Product')));
  }
}
