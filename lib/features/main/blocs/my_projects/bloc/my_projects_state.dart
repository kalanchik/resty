part of 'my_projects_bloc.dart';

sealed class MyProjectsState extends Equatable {
  const MyProjectsState();
}

final class MyProjectsInitial extends MyProjectsState {
  @override
  List<Object?> get props => [];
}

final class MyProjectsLoading extends MyProjectsState {
  @override
  List<Object?> get props => [];
}

final class MyProjectLoaded extends MyProjectsState {
  const MyProjectLoaded(this.projects);

  final List<ProjectInfo> projects;

  @override
  List<Object?> get props => [projects];
}

final class MyProjectError extends MyProjectsState {
  @override
  List<Object?> get props => [];
}
