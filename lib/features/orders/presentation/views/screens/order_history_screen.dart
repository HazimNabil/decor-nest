import 'package:decor_nest/core/di/service_locator.dart';
import 'package:decor_nest/core/widgets/custom_app_bar.dart';
import 'package:decor_nest/features/orders/data/repos/orders_repo_impl.dart';
import 'package:decor_nest/features/orders/presentation/view_models/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:decor_nest/features/orders/presentation/views/widgets/order_history_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryScreen extends StatelessWidget {
  static const path = '/order_history';

  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order History'),
      body: BlocProvider(
        create: (_) {
          return FetchOrdersCubit(locator<OrdersRepoImpl>())..fetchOrders();
        },
        child: const OrderHistoryScreenBody(),
      ),
    );
  }
}
