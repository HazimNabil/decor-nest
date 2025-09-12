import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/core/widgets/failure_indicator.dart';
import 'package:decor_nest/features/admin/presentation/view_models/products_query_bloc/products_query_bloc.dart';
import 'package:decor_nest/features/admin/presentation/views/screens/add_product_screen.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/admin_product_sliver_list.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdminDashboardScreenBody extends StatefulWidget {
  final ScrollController scrollController;

  const AdminDashboardScreenBody({super.key, required this.scrollController});

  @override
  State<AdminDashboardScreenBody> createState() {
    return _AdminDashboardScreenBodyState();
  }
}

class _AdminDashboardScreenBodyState extends State<AdminDashboardScreenBody> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: RefreshIndicator(
        backgroundColor: context.surfaceColor,
        color: context.primaryColor,
        onRefresh: () async {
          context.read<ProductsQueryBloc>().add(const ProductsFetched());
          _searchController.clear();
        },
        child: CustomScrollView(
          controller: widget.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Products', style: AppStyles.semiBold32(context)),
                  const SizedBox(height: 8),
                  Text(
                    'Manage your products',
                    style: AppStyles.regular16(context),
                  ),
                  const SizedBox(height: 24),
                  SearchField(controller: _searchController),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'Add Product',
                    color: context.primaryColor,
                    onPressed: () => context.push(AddProductScreen.path),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            BlocBuilder<ProductsQueryBloc, ProductsQueryState>(
              builder: (_, state) {
                return switch (state.status) {
                  ProductsQueryStatus.loading => Skeletonizer.sliver(
                    child: AdminProductSliverList(
                      products: List.filled(20, Product.dummy()),
                    ),
                  ),
                  ProductsQueryStatus.success => AdminProductSliverList(
                    products: state.products,
                    isFinalPage: state.hasReachedMax,
                  ),
                  ProductsQueryStatus.failure => SliverFillRemaining(
                    hasScrollBody: false,
                    child: FailureIndicator(message: state.errorMessage!),
                  ),
                  _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
