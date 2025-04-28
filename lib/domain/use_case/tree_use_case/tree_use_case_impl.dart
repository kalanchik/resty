import 'package:postmanovich/domain/entity/collection/collection_entity.dart';
import 'package:postmanovich/domain/entity/collection/collection_path_indexer/collection_path_indexer.dart';
import 'package:postmanovich/domain/entity/tree/rebuilder/tree_rebuilder.dart';
import 'package:postmanovich/domain/use_case/tree_use_case/tree_use_case.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TreeUseCaseImpl implements TreeUseCase {
  final CollectionPathIndexer _indexer;
  final Talker _logger;

  const TreeUseCaseImpl({
    required CollectionPathIndexer indexer,
    required Talker logger,
  })  : _indexer = indexer,
        _logger = logger;

  @override
  Future<Folder> addEntityToPath({
    required Folder root,
    required CollectionEntity entity,
    required String folderId,
  }) async {
    final path = _indexer.getPath(folderId);

    final builder = TreeRebuilder(
      targetPath: path,
      updateFn: (parrent) {
        if (parrent is! Folder) {
          throw Exception("Cannot update entity that is not folder");
        }

        return parrent.addChild(entity);
      },
    );

    return builder.rebuild(root) as Folder;
  }

  @override
  Future<Folder> toggleExpasion({
    required Folder root,
    required String folderId,
    required bool isExpanded,
  }) async {
    final path = _indexer.getPath(folderId);

    final builder = TreeRebuilder(
      targetPath: path,
      updateFn: (parrent) {
        if (parrent is! Folder) {
          throw Exception("Cannot update entity that is not folder");
        }

        return parrent.copyWith(isExpanded: isExpanded);
      },
    );

    return builder.rebuild(root) as Folder;
  }

  @override
  Future<Folder> deleteEntity({
    required Folder root,
    required String entityId,
  }) async {
    final path = _indexer.getPath(entityId);

    if (path.isNotEmpty) {
      path.removeLast();
    }

    final builder = TreeRebuilder(
      targetPath: path,
      updateFn: (parrent) {
        if (parrent is! Folder) {
          throw Exception("Cannot update entity that is not folder");
        }

        return parrent.removeChild(entityId);
      },
    );

    return builder.rebuild(root) as Folder;
  }

  @override
  Future<Folder> renameEntity({
    required Folder root,
    required String entityId,
    required String name,
  }) async {
    final path = _indexer.getPath(entityId);

    final builder = TreeRebuilder(
      targetPath: path,
      updateFn: (parrent) {
        if (parrent is! Folder) {
          throw Exception("Cannot update entity that is not folder");
        }

        return parrent.copyWith(name: name);
      },
    );

    return builder.rebuild(root) as Folder;
  }

  @override
  Future<Folder> dragEntity({
    required Folder root,
    required String entityId,
    required String folderId,
  }) async {
    final path = _indexer.getPath(entityId);

    if (path.isNotEmpty) {
      path.removeLast();
    }

    CollectionEntity? result;

    final builder = TreeRebuilder(
      targetPath: path,
      updateFn: (parrent) {
        if (parrent is! Folder) {
          throw Exception("Cannot update entity that is not folder");
        }

        result = parrent.getChild(entityId);

        return parrent.removeChild(entityId);
      },
    );

    final newRoot = builder.rebuild(root) as Folder;

    if (result == null) {
      throw Exception("Cannot find entity");
    }

    _indexer.reindex(newRoot);

    final resultRoot = await addEntityToPath(
      root: newRoot,
      entity: result!,
      folderId: folderId,
    );

    return resultRoot;
  }

  @override
  Future<Folder> getEntity({
    required Folder root,
    required String entityId,
  }) async {
    final path = _indexer.getPath(entityId);

    if (path.isNotEmpty) {
      path.removeLast();
    }

    CollectionEntity? result;

    final builder = TreeRebuilder(
      targetPath: path,
      updateFn: (parrent) {
        if (parrent is! Folder) {
          throw Exception("Cannot update entity that is not folder");
        }

        result = parrent.getChild(entityId);

        return parrent;
      },
    );

    builder.rebuild(root);

    if (result == null) {
      throw Exception("Cannot find entity");
    }

    return result as Folder;
  }
}
