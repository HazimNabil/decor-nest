import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  static const path = '/admin_dashboard';

  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Admin Dashboard'),
      ),
    );
  }
}