import 'package:decor_nest/features/admin/presentation/views/widgets/admin_dashboard_screen_body.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  static const path = '/admin_dashboard';

  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AdminDashboardScreenBody()));
  }
}
