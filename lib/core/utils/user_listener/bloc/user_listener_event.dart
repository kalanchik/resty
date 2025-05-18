part of 'user_listener_bloc.dart';

sealed class UserListenerEvent extends Equatable {
  const UserListenerEvent();
}

final class StartListeningUserEvent extends UserListenerEvent {
  @override
  List<Object?> get props => [];
}
