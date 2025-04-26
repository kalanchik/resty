part of 'folder_rename_bloc.dart';

sealed class FolderRenameEvent extends Equatable {
  const FolderRenameEvent();
}

final class StartFolderRenameEvent extends FolderRenameEvent {
  @override
  List<Object?> get props => [];
}

final class CompleteFolderRenameEvent extends FolderRenameEvent {
  const CompleteFolderRenameEvent({
    required this.newName,
  });

  final String newName;

  @override
  List<Object?> get props => [
        newName,
      ];
}

final class StopFolderRenameEvent extends FolderRenameEvent {
  @override
  List<Object?> get props => [];
}
