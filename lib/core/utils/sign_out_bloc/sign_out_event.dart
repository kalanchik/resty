part of 'sign_out_bloc.dart';

sealed class SignOutEvent extends Equatable {
  const SignOutEvent();
}

final class FetchSignOutEvent extends SignOutEvent {
  @override
  List<Object?> get props => [];
}
