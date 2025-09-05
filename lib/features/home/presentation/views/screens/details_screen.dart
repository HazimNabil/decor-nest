import 'package:decor_nest/features/home/presentation/views/widgets/product_action_bar.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_details_header.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/core/models/product.dart';

class DetailsScreen extends StatelessWidget {
  static const path = '/details';
  final Product product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductThumbnail(image: product.imageUrl!),
            const SizedBox(height: 24),
            ProductDetailsHeader(product: product),
            const Spacer(),
            ProductActionBar(product: product),
          ],
        ),
      ),
    );
  }
}
