import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:postmanovich/domain/entity/project/project_storage_typy.dart';
import 'package:postmanovich/domain/entity/project/project_type.dart';

@immutable
class ProjectCreateParams {
  final String? name;
  final String? description;
  final ProjectType type;
  final ProjectStorageType storageType;

  const ProjectCreateParams({
    required this.name,
    required this.description,
    required this.type,
    required this.storageType,
  });

  factory ProjectCreateParams.init() => const ProjectCreateParams(
        name: null,
        description: null,
        type: ProjectTypePublic(),
        storageType: ProjectStorageTypeCloud(),
      );

  bool get isFilled {
    if (name == null) return false;

    return name!.isNotEmpty;
  }

  ProjectCreateParams copyWith({
    String? name,
    String? description,
    ProjectType? type,
    ProjectStorageType? storageType,
  }) {
    return ProjectCreateParams(
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      storageType: storageType ?? this.storageType,
    );
  }

  Map<String, dynamic> toFireStore(String id) {
    final result = <String, dynamic>{
      "id": id,
      "name": name,
      "type": type.value,
      "storage": storageType.value,
      "createTime": Timestamp.now(),
    };

    if (description != null) {
      result["description"] = description;
    }

    return result;
  }

  @override
  String toString() {
    return 'ProjectCreateParams{name: $name, description: $description, type: $type, storageType: $storageType}';
  }
}
