import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:postmanovich/data/models/project/project_user_dto.dart';
import 'package:postmanovich/domain/entity/project/project_info.dart';
import 'package:postmanovich/domain/entity/project/project_storage_typy.dart';
import 'package:postmanovich/domain/entity/project/project_type.dart';

@immutable
class ProjectInfoDto {
  final String projectType;
  final String id;
  final DateTime createTime;
  final String projectStorageType;
  final List<ProjectUserDto> users;
  final String description;
  final String name;

  const ProjectInfoDto({
    required this.projectType,
    required this.id,
    required this.createTime,
    required this.projectStorageType,
    required this.users,
    required this.description,
    required this.name,
  });

  ProjectInfo toEntity() => ProjectInfo(
        name: name,
        type: ProjectType.fromString(projectType),
        id: id,
        createTime: createTime,
        projectStorageType: ProjectStorageType.fromString(projectStorageType),
        users: users.map((e) => e.toEntity()).toList(),
        description: description,
      );

  factory ProjectInfoDto.fromFirestore(Map<String, dynamic> map) {
    return ProjectInfoDto(
      name: map["name"] as String,
      projectType: map["type"] as String,
      id: map["id"] as String,
      createTime: (map["create_time"] as Timestamp).toDate(),
      projectStorageType: map["storage"] as String,
      users:
          (map["users"] as List).map((e) => ProjectUserDto.fromMap(e)).toList(),
      description: map["description"] as String,
    );
  }
}
