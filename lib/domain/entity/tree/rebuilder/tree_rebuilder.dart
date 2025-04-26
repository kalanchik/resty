import 'package:equatable/equatable.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';

class TreeRebuilder extends Equatable {
  final List<String> targetPath;
  final CollectionEntity Function(CollectionEntity entity) updateFn;

  const TreeRebuilder({
    required this.targetPath,
    required this.updateFn,
  });

  CollectionEntity rebuild(CollectionEntity root) {
    return _rebuildRecursively(
      entity: root,
      currentDepth: 0,
    );
  }

  CollectionEntity _rebuildRecursively({
    required CollectionEntity entity,
    required int currentDepth,
  }) {
    if (_isTargetEntity(entity, currentDepth)) {
      return updateFn(entity);
    }

    return entity is Folder ? _processFolder(entity, currentDepth) : entity;
  }

  bool _isTargetEntity(CollectionEntity entity, int depth) {
    if (targetPath.isEmpty) {
      return true; // обновляем root
    }

    return depth == targetPath.length && entity.id == targetPath.last;
  }

  Folder _processFolder(Folder folder, int depth) {
    final nextSegment = _getNextSegment(depth);

    return folder.copyWith(
      children: folder.children.map((child) {
        if (child.id == nextSegment) {
          return _rebuildRecursively(
            entity: child,
            currentDepth: depth + 1,
          );
        }
        return child;
      }).toList(),
    );
  }

  String? _getNextSegment(int depth) {
    return (depth < targetPath.length) ? targetPath[depth] : null;
  }

  @override
  List<Object?> get props => [targetPath, updateFn];
}
