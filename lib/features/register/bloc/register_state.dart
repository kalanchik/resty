part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
}

final class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

final class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

final class RegisterSuccess extends RegisterState {
  @override
  List<Object?> get props => [];
}

final class RegisterError extends RegisterState {
  final RegisterException error;

  const RegisterError(this.error);

  @override
  List<Object?> get props => [error];
}
