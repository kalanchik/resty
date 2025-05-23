import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/core/error/project_exc/project_exception.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';

part 'project_create_event.dart';
part 'project_create_state.dart';

class ProjectCreateBloc extends Bloc<ProjectCreateEvent, ProjectCreateState> {
  final ProjectUseCase useCase;

  ProjectCreateBloc(this.useCase) : super(ProjectCreateInitial()) {
    on<FetchProjectCreateEvent>((event, emit) async {
      if (state is ProjectCreateLoading) return;

      emit(ProjectCreateLoading());

      final response = await useCase.create(params: event.params);

      if (response.error != null) {
        emit(ProjectCreateError(response.error!));
        return;
      }

      emit(ProjectCreateSuccess());
    });
  }
}
