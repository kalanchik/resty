import 'package:postmanovich/domain/entity/collection/collection_entity.dart';

abstract class TreeUseCase {
  Future<Folder> addEntityToPath({
    required Folder root,
    required CollectionEntity entity,
    required String folderId,
  });

  Future<Folder> toggleExpasion({
    required Folder root,
    required String folderId,
    required bool isExpanded,
  });

  Future<Folder> deleteEntity({
    required Folder root,
    required String entityId,
  });

  Future<Folder> renameEntity({
    required Folder root,
    required String entityId,
    required String name,
  });
}
