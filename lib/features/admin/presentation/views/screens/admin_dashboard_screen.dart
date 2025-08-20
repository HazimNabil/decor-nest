import 'package:decor_nest/core/themes/app_styles.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/search_field.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  static const path = '/admin_dashboard';

  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Products', style: AppStyles.semiBold32(context)),
              const SizedBox(height: 8),
              Text('Manage your products', style: AppStyles.regular16(context)),
              const SizedBox(height: 24),
              const SearchField(),
            ],
          ),
        ),
      ),
    );
  }
}
