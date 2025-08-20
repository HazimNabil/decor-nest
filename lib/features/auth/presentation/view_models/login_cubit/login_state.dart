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
  final bool isAdmin;

  const LoginSuccess(this.isAdmin, super.flow);

  @override
  List<Object?> get props => [isAdmin, flow];
}

final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message, super.flow);

  @override
  List<Object?> get props => [message, flow];
}
