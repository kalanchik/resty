part of 'delete_name_check_bloc.dart';

sealed class DeleteNameCheckEvent extends Equatable {
  const DeleteNameCheckEvent();
}

final class UpdateDeleteNameCheckEvent extends DeleteNameCheckEvent {
  final String projectName;

  const UpdateDeleteNameCheckEvent(this.projectName);

  @override
  List<Object?> get props => [projectName];
}
