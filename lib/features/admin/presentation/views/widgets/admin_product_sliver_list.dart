import 'package:decor_nest/features/admin/presentation/views/widgets/admin_product_card.dart';
import 'package:flutter/material.dart';

class AdminProductSliverList extends StatelessWidget {
  const AdminProductSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) => const AdminProductCard(),
      separatorBuilder: (_, _) => const SizedBox(height: 16),
    );
  }
}
