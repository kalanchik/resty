import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/error/register_error/register_error.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserUseCase useCase;

  RegisterBloc(this.useCase) : super(RegisterInitial()) {
    on<FetchRegisterEvent>((event, emit) async {
      if (state is RegisterLoading) return;

      emit(RegisterLoading());

      final response = await useCase.registerWithEmailAndPassword(
        email: event.email,
        password: event.password,
        username: event.username,
      );

      if (response.error != null) {
        emit(RegisterError(response.error!));
        return;
      }

      emit(RegisterSuccess());
    });
  }
}
