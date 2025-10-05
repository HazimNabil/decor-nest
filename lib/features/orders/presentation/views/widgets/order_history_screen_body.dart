import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/core/widgets/empty_state_widget.dart';
import 'package:decor_nest/core/widgets/failure_indicator.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:decor_nest/features/orders/presentation/view_models/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:decor_nest/features/orders/presentation/views/widgets/order_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderHistoryScreenBody extends StatelessWidget {
  const OrderHistoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (_, state) {
        return switch (state) {
          FetchOrdersLoading() => Skeletonizer(
            child: OrderCardListView(orders: List.filled(10, Order.dummy())),
          ),
          FetchOrdersSuccess(:final orders) =>
            orders.isEmpty
                ? const EmptyStateWidget(
                    image: Assets.imagesNoData,
                    message: 'You have not made any orders yet.',
                  )
                : OrderCardListView(orders: orders),
          FetchOrdersFailure(:final message) => Center(
            child: FailureIndicator(message: message),
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
