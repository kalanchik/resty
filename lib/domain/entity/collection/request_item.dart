part of 'collection_entity.dart';

class RequestItem extends CollectionEntity {
  final HttpMethod method;

  const RequestItem({
    required super.id,
    required super.name,
    required this.method,
  });

  RequestItem copyWith({
    String? id,
    String? name,
    HttpMethod? method,
  }) {
    return RequestItem(
      id: id ?? this.id,
      name: name ?? this.name,
      method: method ?? this.method,
    );
  }

  factory RequestItem.empty(String id) {
    return RequestItem(
      id: id,
      name: "Request",
      method: const HttpMethodGet(),
    );
  }

  @override
  List<Object?> get props => [
        super.id,
        super.name,
        method,
      ];
}
