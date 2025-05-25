part of 'delete_project_bloc.dart';

sealed class DeleteProjectState extends Equatable {
  const DeleteProjectState();
}

final class DeleteProjectInitial extends DeleteProjectState {
  @override
  List<Object?> get props => [];
}

final class DeleteProjectLoading extends DeleteProjectState {
  @override
  List<Object?> get props => [];
}

final class DeleteProjectSuccess extends DeleteProjectState {
  @override
  List<Object?> get props => [];
}

final class DeleteProjectError extends DeleteProjectState {
  final ProjectDeleteException error;

  const DeleteProjectError(this.error);

  @override
  List<Object?> get props => [error];
}
