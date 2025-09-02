import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart' show Product;
import 'package:decor_nest/features/admin/presentation/views/widgets/admin_product_card.dart';
import 'package:flutter/material.dart';

class AdminProductSliverList extends StatelessWidget {
  final List<Product> products;
  final bool isFinalPage;

  const AdminProductSliverList({
    super.key,
    required this.products,
    required this.isFinalPage,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: isFinalPage ? products.length : products.length + 1,
      itemBuilder: (_, index) {
        if (index == products.length) {
          return Center(
            child: CircularProgressIndicator(color: context.primaryColor),
          );
        }
        return AdminProductCard(product: products[index]);
      },
      separatorBuilder: (_, _) => const SizedBox(height: 16),
    );
  }
}
