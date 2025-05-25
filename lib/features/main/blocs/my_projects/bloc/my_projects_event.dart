part of 'my_projects_bloc.dart';

sealed class MyProjectsEvent extends Equatable {
  const MyProjectsEvent();
}

final class FetchMyProjectsEvent extends MyProjectsEvent {
  @override
  List<Object?> get props => [];
}

final class DataMyProjectsEvent extends MyProjectsEvent {
  final List<ProjectInfo>? projects;

  const DataMyProjectsEvent(this.projects);

  @override
  List<Object?> get props => [projects];
}

final class ErrorMyProjectsEvent extends MyProjectsEvent {
  @override
  List<Object?> get props => [];
}
