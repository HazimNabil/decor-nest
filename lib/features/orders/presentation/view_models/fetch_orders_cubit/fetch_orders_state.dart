part of 'fetch_orders_cubit.dart';

sealed class FetchOrdersState extends Equatable {
  const FetchOrdersState();

  @override
  List<Object> get props => [];
}

final class FetchOrdersInitial extends FetchOrdersState {
  const FetchOrdersInitial();
}

final class FetchOrdersLoading extends FetchOrdersState {
  const FetchOrdersLoading();
}

final class FetchOrdersSuccess extends FetchOrdersState {
  final List<Order> orders;

  const FetchOrdersSuccess(this.orders);

  @override
  List<Object> get props => [orders];
}

final class FetchOrdersFailure extends FetchOrdersState {
  final String message;

  const FetchOrdersFailure(this.message);

  @override
  List<Object> get props => [message];
}
