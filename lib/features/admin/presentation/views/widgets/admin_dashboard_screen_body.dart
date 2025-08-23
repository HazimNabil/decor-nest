import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/admin/presentation/view_models/read_products_bloc/read_products_bloc.dart';
import 'package:decor_nest/features/admin/presentation/views/screens/add_product_screen.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/admin_product_sliver_list.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminDashboardScreenBody extends StatefulWidget {
  const AdminDashboardScreenBody({super.key});

  @override
  State<AdminDashboardScreenBody> createState() {
    return _AdminDashboardScreenBodyState();
  }
}

class _AdminDashboardScreenBodyState extends State<AdminDashboardScreenBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final currentPosition = _scrollController.position.pixels;
    final maxPosition = _scrollController.position.maxScrollExtent;

    if (currentPosition >= maxPosition * 0.7) {
      context.read<ReadProductsBloc>().add(const ProductsFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: CustomScrollView(
        controller: _scrollController,
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
                const SearchField(),
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
          BlocBuilder<ReadProductsBloc, ReadProductsState>(
            builder: (_, state) {
              return switch (state.status) {
                ReadProductsStatus.loading => const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
                ReadProductsStatus.success => AdminProductSliverList(
                  products: state.products,
                  isFinalPage: state.hasReachedMax,
                ),
                ReadProductsStatus.failure => SliverToBoxAdapter(
                  child: Center(child: Text(state.errorMessage!)),
                ),
                _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
              };
            },
          ),
        ],
      ),
    );
  }
}
