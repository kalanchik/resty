part of 'delete_name_check_bloc.dart';

sealed class DeleteNameCheckState extends Equatable {
  const DeleteNameCheckState();
}

final class DeleteNameCheckInitial extends DeleteNameCheckState {
  @override
  List<Object?> get props => [];
}

final class DeleteNameCheckSuccess extends DeleteNameCheckState {
  @override
  List<Object?> get props => [];
}

final class DeleteNameCheckError extends DeleteNameCheckState {
  final String message;

  const DeleteNameCheckError(this.message);

  @override
  List<Object?> get props => [message];
}
