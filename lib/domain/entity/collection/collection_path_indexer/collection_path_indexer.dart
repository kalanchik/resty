import 'package:equatable/equatable.dart';
import 'package:postmanovich/domain/entity/collection/collection_entity.dart';
import 'package:postmanovich/domain/entity/collection/collection_path_indexer/path_indexer.dart';

class CollectionPathIndexer extends Equatable {
  const CollectionPathIndexer({
    required PathIndexer indexer,
  }) : _indexer = indexer;

  final PathIndexer _indexer;

  void reindex(Folder root) {
    _indexer.clear();
    // Корень индексируем с пустым путем и не включаем его id в путь
    _indexer[root.id] = [];
    for (final child in root.children) {
      _traverse(child, parentPath: []);
    }
  }

  void _traverse(
    CollectionEntity entity, {
    required List<String> parentPath,
  }) {
    final currentPath = [...parentPath, entity.id];
    _indexer[entity.id] = currentPath;

    if (entity is Folder) {
      for (final child in entity.children) {
        _traverse(child, parentPath: currentPath);
      }
    }
  }

  List<String> getPath(String entityId) => _indexer[entityId] ?? [];

  @override
  List<Object?> get props => [_indexer];
}
