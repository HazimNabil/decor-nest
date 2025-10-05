import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:decor_nest/features/orders/data/repos/orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  final OrdersRepo _ordersRepo;

  FetchOrdersCubit(this._ordersRepo) : super(const FetchOrdersInitial());

  Future<void> fetchOrders() async {
    emit(const FetchOrdersLoading());

    final result = await _ordersRepo.fetchOrders();
    result.fold(
      (failure) => emit(FetchOrdersFailure(failure.message)),
      (orders) => emit(FetchOrdersSuccess(orders)),
    );
  }
}
