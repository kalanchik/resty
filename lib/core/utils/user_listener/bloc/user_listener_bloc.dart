import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';

part 'user_listener_event.dart';
part 'user_listener_state.dart';

class UserListenerBloc extends Bloc<UserListenerEvent, UserListenerState> {
  final UserUseCase useCase;

  UserListenerBloc(this.useCase) : super(UserListenerInitial()) {
    on<StartListeningUserEvent>((event, emit) {
      _subscription = useCase.authStateChanges().listen((user) {
        add(UpdateUserListenerEvent(user));
      }) as StreamSubscription<User?>;
    });
    on<UpdateUserListenerEvent>((event, emit) {
      if (event.user != null) {
        emit(UserSignInState(event.user!));
        return;
      }

      emit(UserSignOutState());
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  StreamSubscription<User?>? _subscription;
}
