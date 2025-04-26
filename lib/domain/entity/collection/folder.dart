part of 'collection_entity.dart';

/// Сущность папки
class Folder extends CollectionEntity {
  final List<CollectionEntity> children;
  final bool isExpanded;

  const Folder({
    required super.id,
    required super.name,
    required this.isExpanded,
    required this.children,
  });

  /// Добавляет дочернюю сущность в папку
  Folder addChild(CollectionEntity child) {
    return copyWith(children: [...children, child]);
  }

  /// Убирает дочернюю сущность из папки по [childId]
  Folder removeChild(String childId) {
    return copyWith(children: children.where((e) => e.id != childId).toList());
  }

  Folder copyWith({
    String? id,
    String? name,
    List<CollectionEntity>? children,
    bool? isExpanded,
  }) {
    return Folder(
      id: id ?? this.id,
      name: name ?? this.name,
      children: children ?? this.children,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  factory Folder.empty(String folderId) => Folder(
        id: folderId,
        name: "Folder",
        isExpanded: false,
        children: const [],
      );

  @override
  List<Object?> get props => [
        super.id,
        super.name,
        isExpanded,
        children,
      ];
}
