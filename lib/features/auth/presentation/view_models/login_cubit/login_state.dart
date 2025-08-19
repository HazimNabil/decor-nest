part of 'login_cubit.dart';

enum LoginFlow { email, google }

sealed class LoginState extends Equatable {
  final LoginFlow? flow;

  const LoginState([this.flow]);

  @override
  List<Object?> get props => [flow];
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class LoginLoading extends LoginState {
  const LoginLoading(super.flow);
}

final class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess(this.user, super.flow);

  @override
  List<Object?> get props => [flow, user];
}

final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message, super.flow);

  @override
  List<Object?> get props => [flow, message];
}
