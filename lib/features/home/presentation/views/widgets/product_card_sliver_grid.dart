import 'package:decor_nest/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductCardSliverGrid extends StatelessWidget {
  const ProductCardSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.71,
      ),
      itemCount: 10,
      itemBuilder: (_, _) {
        return const ProductCard();
      },
    );
  }
}
