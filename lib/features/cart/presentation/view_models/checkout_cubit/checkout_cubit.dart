import 'package:decor_nest/features/cart/data/models/cart_product.dart';
import 'package:decor_nest/features/cart/data/models/payment_request.dart';
import 'package:decor_nest/features/cart/data/repos/cart_repo.dart';
import 'package:decor_nest/features/cart/data/services/payment_service.dart';
import 'package:decor_nest/features/orders/data/models/order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:decor_nest/features/orders/data/repos/orders_repo.dart';
import 'package:flutter_paymob/paymob_response.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final PaymentService paymentService;
  final OrdersRepo ordersRepo;
  final CartRepo cartRepo;

  CheckoutCubit({
    required this.paymentService,
    required this.ordersRepo,
    required this.cartRepo,
  }) : super(const CheckoutInitial());

  Future<void> processPayment(PaymentRequest request) async {
    emit(const PaymentLoading());

    try {
      await paymentService.processPayment(
        request: request,
        onPayment: _handlePaymentResponse,
      );
      if (state is PaymentLoading) {
        emit(const CheckoutInitial());
      }
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  void _handlePaymentResponse(PaymentPaymobResponse response) {
    response.success
        ? emit(const PaymentSuccess())
        : emit(PaymentFailure(response.message!));
  }

  Future<void> decreaseStock(List<CartProduct> cartProducts) async {
    final result = await cartRepo.decreaseStock(cartProducts);
    result.fold((failure) => emit(CheckoutFailure(failure.message)), (_) {});
  }

  Future<void> createOrder(Order order) async {
    final result = await ordersRepo.createOrder(order);
    result.fold((failure) {
      emit(CheckoutFailure(failure.message));
    }, (_) => {});
  }
}
