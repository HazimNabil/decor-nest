part of 'checkout_cubit.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

final class CheckoutInitial extends CheckoutState {
  const CheckoutInitial();
}

final class PaymentLoading extends CheckoutState {
  const PaymentLoading();
}

final class PaymentSuccess extends CheckoutState {
  const PaymentSuccess();
}

final class PaymentFailure extends CheckoutState {
  final String message;

  const PaymentFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class CheckoutFailure extends CheckoutState {
  final String message;

  const CheckoutFailure(this.message);

  @override
  List<Object> get props => [message];
}
