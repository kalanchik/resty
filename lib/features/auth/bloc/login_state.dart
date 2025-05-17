part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginSuccess extends LoginState {
  @override
  List<Object?> get props => [];
}

final class LoginError extends LoginState {
  final AuthError error;

  const LoginError(this.error);

  @override
  List<Object?> get props => [error];
}
