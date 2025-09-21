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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ProductThumbnail(product: product)),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(child: ProductDetailsHeader(product: product)),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                spacing: 24,
                children: [
                  const Spacer(),
                  ProductActionBar(product: product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
