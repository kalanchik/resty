part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
}

final class FetchRegisterEvent extends RegisterEvent {
  final String username;
  final String email;
  final String password;

  const FetchRegisterEvent({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [username, email, password];
}
