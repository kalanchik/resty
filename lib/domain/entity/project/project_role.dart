import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
sealed class ProjectRole extends Equatable {
  const ProjectRole();

  int get id;
  String getName(BuildContext context);

  factory ProjectRole.fromInt(int id) {
    return switch (id) {
      0 => const ProjectRoleOwner(),
      1 => const ProjectRoleEditor(),
      2 => const ProjectRoleViewer(),
      _ => throw const FormatException("this role doesn't exist"),
    };
  }
}

class ProjectRoleOwner extends ProjectRole {
  const ProjectRoleOwner();

  @override
  String getName(BuildContext context) {
    return "Создатель";
  }

  @override
  int get id => 0;

  @override
  List<Object?> get props => [id, "owner"];
}

class ProjectRoleEditor extends ProjectRole {
  const ProjectRoleEditor();

  @override
  String getName(BuildContext context) {
    return "Редактор";
  }

  @override
  int get id => 1;

  @override
  List<Object?> get props => [id, "editor"];
}

class ProjectRoleViewer extends ProjectRole {
  const ProjectRoleViewer();

  @override
  String getName(BuildContext context) {
    return "Просмотр";
  }

  @override
  int get id => 2;

  @override
  List<Object?> get props => [id, "viewer"];
}
