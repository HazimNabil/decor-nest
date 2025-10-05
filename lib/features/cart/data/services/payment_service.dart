import 'package:flutter_paymob/flutter_paymob.dart';
import 'package:decor_nest/core/helper/app_secrets.dart';
import 'package:decor_nest/features/cart/data/models/payment_request.dart';
import 'package:flutter_paymob/paymob_response.dart';

class PaymentService {
  final _paymob = FlutterPaymob.instance;

  Future<void> init() async {
    await _paymob.initialize(
      apiKey: AppSecrets.paymobApiKey,
      iFrameID: AppSecrets.paymobIFrameId,
      integrationID: AppSecrets.paymobIntegrationId,
      walletIntegrationId: AppSecrets.paymobIntegrationId,
    );
  }

  Future<void> processPayment({
    required PaymentRequest request,
    required void Function(PaymentPaymobResponse) onPayment,
  }) async {
    await _paymob.payWithCard(
      context: request.context,
      amount: request.amount,
      currency: request.currency,
      title: request.title,
      appBarColor: request.appBarColor,
      onPayment: onPayment,
    );
  }
}
