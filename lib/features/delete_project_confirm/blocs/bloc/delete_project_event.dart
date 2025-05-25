part of 'delete_project_bloc.dart';

sealed class DeleteProjectEvent extends Equatable {
  const DeleteProjectEvent();
}

final class FetchDeleteProjectEvent extends DeleteProjectEvent {
  final String projectId;

  const FetchDeleteProjectEvent(
    this.projectId,
  );

  @override
  List<Object?> get props => [projectId];
}
