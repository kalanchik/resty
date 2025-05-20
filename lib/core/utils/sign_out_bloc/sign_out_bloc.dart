import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  final UserUseCase useCase;

  SignOutBloc(this.useCase) : super(SignOutInitial()) {
    on<FetchSignOutEvent>((event, emit) async {
      if (state is SignOutLoading) return;

      emit(SignOutLoading());

      final response = await useCase.signOut();

      if (response.error == null) {
        emit(SignOutSuccess());
      }
    });
  }
}
