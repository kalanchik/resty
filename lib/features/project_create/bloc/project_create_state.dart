part of 'project_create_bloc.dart';

sealed class ProjectCreateState extends Equatable {
  const ProjectCreateState();
}

final class ProjectCreateInitial extends ProjectCreateState {
  @override
  List<Object?> get props => [];
}

final class ProjectCreateLoading extends ProjectCreateState {
  @override
  List<Object?> get props => [];
}

final class ProjectCreateSuccess extends ProjectCreateState {
  @override
  List<Object?> get props => [];
}

final class ProjectCreateError extends ProjectCreateState {
  final ProjectException error;

  const ProjectCreateError(this.error);

  @override
  List<Object?> get props => [error];
}
