import 'package:flutter/widgets.dart';

class PaymentRequest {
  final double amount;
  final String currency;
  final BuildContext context;
  final Widget title;
  final Color appBarColor;

  const PaymentRequest({
    required this.amount,
    this.currency = 'EGP',
    required this.context,
    required this.title,
    required this.appBarColor,
  });
}
