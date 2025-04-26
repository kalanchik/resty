part of 'folder_rename_bloc.dart';

sealed class FolderRenameState extends Equatable {
  const FolderRenameState();
}

final class FolderRenameInitial extends FolderRenameState {
  @override
  List<Object?> get props => [];
}

final class FolderRanaming extends FolderRenameState {
  @override
  List<Object?> get props => [];
}

final class FolderRenamed extends FolderRenameState {
  const FolderRenamed(this.newName);

  final String newName;

  @override
  List<Object?> get props => [newName];
}
