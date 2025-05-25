import 'package:postmanovich/core/error/project_exc/project_exception.dart';
import 'package:postmanovich/data/models/project/project_info_dto.dart';
import 'package:postmanovich/data/models/project/project_user_dto.dart';
import 'package:postmanovich/data/repository/project_firebase_repository.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';
import 'package:postmanovich/domain/entity/project/project_info.dart';
import 'package:postmanovich/domain/entity/project/project_role.dart';
import 'package:postmanovich/domain/entity/project/project_user.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ProjectFirestoreUseCase implements ProjectUseCase {
  final ProjectFirebaseRepository _repository;
  final UserUseCase _userUseCase;
  final Talker _logger;

  ProjectFirestoreUseCase(
    this._repository,
    this._userUseCase,
    this._logger,
  );

  @override
  Future<ProjectCreate> create({required ProjectCreateParams params}) async {
    try {
      final user = await _userUseCase.getCurrentUser();

      if (user == null) {
        return (
          data: null,
          error: ProjectUnknownException(),
        );
      }

      final ProjectUser projectUser = ProjectUser(
        userId: user.uid,
        role: const ProjectRoleOwner(),
      );

      final response = await _repository.create(
        params: params,
        user: ProjectUserDto.fromEntity(projectUser),
      );

      if (!response) {
        return (
          data: null,
          error: ProjectUnknownException(),
        );
      }

      return (data: true, error: null);
    } catch (e) {
      return (
        data: null,
        error: ProjectUnknownException(),
      );
    }
  }

  @override
  Future<List<ProjectInfo>?> myProjects() async {
    final currentUser = await _userUseCase.getCurrentUser();

    if (currentUser == null) {
      return null;
    }

    final response = await _repository.myProjects(userId: currentUser.uid);

    if (response == null) {
      return null;
    }

    try {
      return response
          .map((e) => ProjectInfoDto.fromFirestore(e).toEntity())
          .toList();
    } catch (e) {
      return null;
    }
  }

  @override
  Stream<List<ProjectInfo>?> myProjectsStream() async* {
    final currentUser = await _userUseCase.getCurrentUser();

    if (currentUser == null) {
      throw ProjectUnknownException();
    }

    yield* _repository.myProjectsStream(userId: currentUser.uid).map((event) =>
        event.map((e) => ProjectInfoDto.fromFirestore(e).toEntity()).toList());
  }

  @override
  Future<ProjectDelete> deleteProject({required String projectId}) async {
    final response = await _repository.deleteProject(
      projectId: projectId,
    );

    return (
      data: response,
      error: null,
    );
  }
}
