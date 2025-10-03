import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  static const path = '/order_history';

  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Order History'),
    );
  }
}
