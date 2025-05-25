import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:postmanovich/domain/entity/project/project_storage_typy.dart';
import 'package:postmanovich/domain/entity/project/project_type.dart';
import 'package:postmanovich/domain/entity/project/project_user.dart';

@immutable
class ProjectInfo extends Equatable {
  final ProjectType type;
  final String id;
  final DateTime createTime;
  final ProjectStorageType projectStorageType;
  final List<ProjectUser> users;
  final String description;
  final String name;

  const ProjectInfo({
    required this.name,
    required this.type,
    required this.id,
    required this.createTime,
    required this.projectStorageType,
    required this.users,
    required this.description,
  });

  @override
  String toString() {
    return 'ProjectInfo{name: $name, type: $type, id: $id, createTime: $createTime, projectStorageType: $projectStorageType, users: $users, description: $description}';
  }

  @override
  List<Object?> get props => [
        name,
        type,
        id,
        createTime,
        projectStorageType,
        users,
        description,
      ];
}
