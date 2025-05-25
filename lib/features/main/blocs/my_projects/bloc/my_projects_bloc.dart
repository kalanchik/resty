import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/domain/entity/project/project_info.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';

part 'my_projects_event.dart';
part 'my_projects_state.dart';

class MyProjectsBloc extends Bloc<MyProjectsEvent, MyProjectsState> {
  final ProjectUseCase useCase;

  MyProjectsBloc(this.useCase) : super(MyProjectsInitial()) {
    on<FetchMyProjectsEvent>((event, emit) async {
      if (state is MyProjectsLoading) return;

      emit(MyProjectsLoading());

      if (_subscription != null) {
        _subscription?.cancel();
        _subscription = null;
      }

      _subscription = useCase.myProjectsStream().listen((event) {
        add(DataMyProjectsEvent(event));
      })
        ..onError((_) {
          add(ErrorMyProjectsEvent());
        });
    });
    on<DataMyProjectsEvent>((event, emit) {
      if (event.projects == null) {
        emit(MyProjectError());
        return;
      }

      emit(MyProjectLoaded(event.projects!));
    });
    on<ErrorMyProjectsEvent>((event, emit) => emit(MyProjectError()));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  StreamSubscription<List<ProjectInfo>?>? _subscription;
}
