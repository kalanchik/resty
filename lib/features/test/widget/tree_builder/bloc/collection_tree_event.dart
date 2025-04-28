part of 'collection_tree_bloc.dart';

sealed class CollectionTreeEvent extends Equatable {
  const CollectionTreeEvent();
}

final class InitRootEvent extends CollectionTreeEvent {
  const InitRootEvent();

  @override
  List<Object?> get props => [];
}

final class BuildRootEvent extends CollectionTreeEvent {
  const BuildRootEvent(this.newRoot);

  final Folder newRoot;

  @override
  List<Object?> get props => [newRoot];
}

final class ChangeFolderExpandEvent extends CollectionTreeEvent {
  final String folderId;
  final bool isExpanded;

  const ChangeFolderExpandEvent({
    required this.folderId,
    required this.isExpanded,
  });

  @override
  List<Object?> get props => [folderId, isExpanded];
}

final class AddFolderEvent extends CollectionTreeEvent {
  const AddFolderEvent(this.folderId);

  final String folderId;

  @override
  List<Object?> get props => [folderId];
}

final class AddRequestEvent extends CollectionTreeEvent {
  const AddRequestEvent(this.folderId);

  final String folderId;

  @override
  List<Object?> get props => [folderId];
}

final class DeleteEntityEvent extends CollectionTreeEvent {
  const DeleteEntityEvent(this.entityId);

  final String entityId;

  @override
  List<Object?> get props => [entityId];
}

final class RenameEntityEvent extends CollectionTreeEvent {
  final String entityId;
  final String newName;

  const RenameEntityEvent({
    required this.entityId,
    required this.newName,
  });

  @override
  List<Object?> get props => [entityId, newName];
}

final class DragEntityEvent extends CollectionTreeEvent {
  final String entityId;
  final String folderId;

  const DragEntityEvent({
    required this.entityId,
    required this.folderId,
  });

  @override
  List<Object?> get props => [
        entityId,
        folderId,
      ];
}
