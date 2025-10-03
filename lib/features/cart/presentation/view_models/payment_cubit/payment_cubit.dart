import 'package:decor_nest/features/cart/data/models/payment_request.dart';
import 'package:decor_nest/features/cart/data/services/payment_service.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:decor_nest/features/orders/data/repos/orders_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentService _paymentService;
  final OrdersRepo _ordersRepo;

  PaymentCubit(this._paymentService, this._ordersRepo)
    : super(const PaymentInitial());

  Future<void> processPayment(PaymentRequest request) async {
    emit(const PaymentLoading());

    try {
      await _paymentService.processPayment(
        request: request,
        onPayment: (response) {
          response.success
              ? emit(const PaymentSuccess())
              : emit(PaymentFailure(response.message!));
        },
      );
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  Future<void> createOrder(Order order) async {
    final result = await _ordersRepo.createOrder(order);
    result.fold((failure) {
      emit(CreateOrderFailure(failure.message));
    }, (_) => {});
  }
}
