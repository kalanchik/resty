import 'package:equatable/equatable.dart';
import 'package:postmanovich/domain/entity/request_method/http_method.dart';

part 'folder.dart';
part 'request_item.dart';

/// Базовая сущность коллекций
sealed class CollectionEntity extends Equatable {
  final String id;
  final String name;

  const CollectionEntity({
    required this.id,
    required this.name,
  });
}
