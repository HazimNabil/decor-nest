import 'package:decor_nest/features/admin/presentation/view_models/products_query_bloc/products_query_bloc.dart';
import 'package:decor_nest/features/admin/presentation/views/widgets/admin_dashboard_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDashboardScreen extends StatefulWidget {
  static const path = '/admin_dashboard';

  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final currentPosition = _scrollController.position.pixels;
    final maxPosition = _scrollController.position.maxScrollExtent;

    if (currentPosition >= maxPosition * 0.7) {
      context.read<ProductsQueryBloc>().add(const ProductsMoreFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AdminDashboardScreenBody(scrollController: _scrollController),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        mini: true,
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
