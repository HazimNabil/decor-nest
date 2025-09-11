import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo_impl.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_action_bar.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_details_header.dart';
import 'package:decor_nest/features/home/presentation/views/widgets/product_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/home/presentation/view_models/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  BlocProvider(
                    create: (context) =>
                        AddToCartCubit(locator<CartRepoImpl>()),
                    child: ProductActionBar(product: product),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
