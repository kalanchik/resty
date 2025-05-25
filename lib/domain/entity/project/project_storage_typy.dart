import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:postmanovich/config/constants/globals.dart';

@immutable
sealed class ProjectStorageType extends Equatable {
  const ProjectStorageType();

  String get value;

  factory ProjectStorageType.fromString(String value) {
    return switch (value) {
      Globals.projectStorageTypeCloud => const ProjectStorageTypeCloud(),
      Globals.projectStorageTypeLocal => const ProjectStorageTypeLocal(),
      Globals.projectStorageTypeGithub => const ProjectStorageTypeGitHub(),
      Globals.projectStorageTypeGitlab => const ProjectStorageTypeGitLab(),
      _ => const ProjectStorageTypeCloud(),
    };
  }

  factory ProjectStorageType.fromTap(int index) {
    return switch (index) {
      1 => const ProjectStorageTypeCloud(),
      2 => const ProjectStorageTypeLocal(),
      3 => const ProjectStorageTypeGitHub(),
      4 => const ProjectStorageTypeGitLab(),
      _ => const ProjectStorageTypeCloud(),
    };
  }
}

class ProjectStorageTypeCloud extends ProjectStorageType {
  const ProjectStorageTypeCloud();

  @override
  String get value => Globals.projectStorageTypeCloud;

  @override
  List<Object?> get props => [value];
}

class ProjectStorageTypeLocal extends ProjectStorageType {
  const ProjectStorageTypeLocal();

  @override
  String get value => Globals.projectStorageTypeLocal;

  @override
  List<Object?> get props => [value];
}

class ProjectStorageTypeGitHub extends ProjectStorageType {
  const ProjectStorageTypeGitHub();

  @override
  String get value => Globals.projectStorageTypeGithub;

  @override
  List<Object?> get props => [value];
}

class ProjectStorageTypeGitLab extends ProjectStorageType {
  const ProjectStorageTypeGitLab();

  @override
  String get value => Globals.projectStorageTypeGitlab;

  @override
  List<Object?> get props => [value];
}
