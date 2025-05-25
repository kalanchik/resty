import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:postmanovich/core/error/project_exc/project_delete.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';

part 'delete_project_event.dart';
part 'delete_project_state.dart';

class DeleteProjectBloc extends Bloc<DeleteProjectEvent, DeleteProjectState> {
  final ProjectUseCase useCase;

  DeleteProjectBloc(this.useCase) : super(DeleteProjectInitial()) {
    on<FetchDeleteProjectEvent>((event, emit) async {
      if (state is DeleteProjectLoading) return;

      emit(DeleteProjectLoading());

      final response = await useCase.deleteProject(
        projectId: event.projectId,
      );

      if (response.error != null) {
        emit(DeleteProjectError(response.error!));
        return;
      }

      emit(DeleteProjectSuccess());
    });
  }
}
