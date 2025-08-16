part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

@immutable
final class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

@immutable
final class SignUpLoading extends SignUpState {
  const SignUpLoading();
}

@immutable
final class SignUpSuccess extends SignUpState {
  const SignUpSuccess();
}

@immutable
final class SignUpFailure extends SignUpState {
  final String message;

  const SignUpFailure(this.message);

  @override
  List<Object> get props => [message];
}
