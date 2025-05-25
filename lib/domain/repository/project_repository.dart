import 'package:postmanovich/data/models/project/project_user_dto.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';

abstract interface class ProjectRepository {
  Future<dynamic> create({
    required ProjectCreateParams params,
    required ProjectUserDto user,
  });

  Future<dynamic> myProjects({
    required String userId,
  });

  Stream myProjectsStream({
    required String userId,
  });

  Future<dynamic> deleteProject({
    required String projectId,
  });
}
