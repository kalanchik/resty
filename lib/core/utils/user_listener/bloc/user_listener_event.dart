part of 'user_listener_bloc.dart';

sealed class UserListenerEvent extends Equatable {
  const UserListenerEvent();
}

final class StartListeningUserEvent extends UserListenerEvent {
  @override
  List<Object?> get props => [];
}

final class UpdateUserListenerEvent extends UserListenerEvent {
  final User? user;

  const UpdateUserListenerEvent(this.user);

  @override
  List<Object?> get props => [user];
}
