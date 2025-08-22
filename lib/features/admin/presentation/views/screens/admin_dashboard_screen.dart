import 'package:decor_nest/core/helper/extensions.dart';
import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/admin/presentation/views/screens/add_product_screen.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/admin_product_sliver_list.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminDashboardScreen extends StatelessWidget {
  static const path = '/admin_dashboard';

  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: CustomScrollView(
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
              const AdminProductSliverList(),
            ],
          ),
        ),
      ),
    );
  }
}
