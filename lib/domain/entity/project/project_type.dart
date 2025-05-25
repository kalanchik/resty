import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:postmanovich/config/constants/globals.dart';

@immutable
sealed class ProjectType extends Equatable {
  const ProjectType();

  String get value;

  String name(BuildContext context);

  factory ProjectType.fromString(String value) {
    return switch (value) {
      Globals.projectTypePublic => const ProjectTypePublic(),
      Globals.projectTypePrivate => const ProjectTypePrivate(),
      _ => const ProjectTypePublic(),
    };
  }

  factory ProjectType.fromTab(int index) {
    return switch (index) {
      0 => const ProjectTypePublic(),
      1 => const ProjectTypePrivate(),
      _ => const ProjectTypePublic(),
    };
  }
}

class ProjectTypePublic extends ProjectType {
  const ProjectTypePublic();

  @override
  String get value => Globals.projectTypePublic;

  @override
  List<Object?> get props => [value];

  @override
  String name(BuildContext context) {
    return "Публичный";
  }
}

class ProjectTypePrivate extends ProjectType {
  const ProjectTypePrivate();

  @override
  String get value => Globals.projectTypePrivate;

  @override
  List<Object?> get props => [value];

  @override
  String name(BuildContext context) {
    return "Приватный";
  }
}
