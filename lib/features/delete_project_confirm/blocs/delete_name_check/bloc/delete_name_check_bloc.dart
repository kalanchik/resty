import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_name_check_event.dart';
part 'delete_name_check_state.dart';

class DeleteNameCheckBloc
    extends Bloc<DeleteNameCheckEvent, DeleteNameCheckState> {
  final String projectName;

  DeleteNameCheckBloc(this.projectName) : super(DeleteNameCheckInitial()) {
    on<UpdateDeleteNameCheckEvent>((event, emit) {
      if (event.projectName.isEmpty) {
        emit(const DeleteNameCheckError("Заполните поле"));
        return;
      }

      if (event.projectName != projectName) {
        emit(const DeleteNameCheckError("Неверное имя"));
        return;
      }

      emit(DeleteNameCheckSuccess());
    });
  }
}
