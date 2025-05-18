part of 'user_listener_bloc.dart';

sealed class UserListenerState extends Equatable {
  const UserListenerState();
}

final class UserListenerInitial extends UserListenerState {
  @override
  List<Object?> get props => [];
}

final class UserSignInState extends UserListenerState {
  @override
  List<Object?> get props => [];
}

final class UserSignOutState extends UserListenerState {
  @override
  List<Object?> get props => [];
}
