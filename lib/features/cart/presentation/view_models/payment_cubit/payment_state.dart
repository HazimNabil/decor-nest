part of 'payment_cubit.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {
  const PaymentInitial();
}

final class PaymentLoading extends PaymentState {
  const PaymentLoading();
}

final class PaymentSuccess extends PaymentState {
  const PaymentSuccess();
}

final class PaymentFailure extends PaymentState {
  final String message;

  const PaymentFailure(this.message);

  @override
  List<Object> get props => [message];
}
