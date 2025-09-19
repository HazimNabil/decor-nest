import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductCardSliverGrid extends StatelessWidget {
  final List<Product> products;

  const ProductCardSliverGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.71,
      ),
      itemCount: products.length,
      itemBuilder: (_, index) {
        return ProductCard(
          key: ValueKey(products[index].id),
          product: products[index],
        );
      },
    );
  }
}
