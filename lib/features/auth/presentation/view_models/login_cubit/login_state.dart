part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

@immutable
final class LoginInitial extends LoginState {
  const LoginInitial();
}

@immutable
final class LoginLoading extends LoginState {
  const LoginLoading();
}

@immutable
final class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess(this.user);

  @override
  List<Object> get props => [user];
}

@immutable
final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);

  @override
  List<Object> get props => [message];
}
