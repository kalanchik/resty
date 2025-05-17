import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/error/auth_error/auth_error.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserUseCase userCase;

  LoginBloc(this.userCase) : super(LoginInitial()) {
    on<FetchLoginEvent>((event, emit) async {
      if (state is LoginLoading) return;

      emit(LoginLoading());

      final response = await userCase.loginWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (response.error != null) {
        emit(LoginError(response.error!));
        return;
      }

      emit(LoginSuccess());
    });
  }
}
