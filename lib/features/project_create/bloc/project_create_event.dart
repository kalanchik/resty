part of 'project_create_bloc.dart';

sealed class ProjectCreateEvent extends Equatable {
  const ProjectCreateEvent();
}

final class FetchProjectCreateEvent extends ProjectCreateEvent {
  final ProjectCreateParams params;

  const FetchProjectCreateEvent(this.params);

  @override
  List<Object?> get props => [params];
}
