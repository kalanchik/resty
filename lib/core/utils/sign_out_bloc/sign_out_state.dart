part of 'sign_out_bloc.dart';

sealed class SignOutState extends Equatable {
  const SignOutState();
}

final class SignOutInitial extends SignOutState {
  @override
  List<Object?> get props => [];
}

final class SignOutLoading extends SignOutState {
  @override
  List<Object?> get props => [];
}

final class SignOutSuccess extends SignOutState {
  @override
  List<Object?> get props => [];
}
