import 'package:decor_nest/features/cart/data/models/payment_request.dart';
import 'package:decor_nest/features/cart/data/services/payment_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_paymob/paymob_response.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentService _paymentService;

  PaymentCubit(this._paymentService) : super(const PaymentInitial());

  Future<void> processPayment(PaymentRequest request) async {
    emit(const PaymentLoading());

    try {
      await _paymentService.processPayment(
        request: request,
        onPayment: _handlePaymentResponse,
      );
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  void _handlePaymentResponse(PaymentPaymobResponse response) {
    if (response.success) {
      emit(const PaymentSuccess());
    } else {
      emit(PaymentFailure(response.message!));
    }
  }
}
