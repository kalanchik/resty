import 'package:postmanovich/core/error/project_exc/project_delete.dart';
import 'package:postmanovich/core/error/project_exc/project_exception.dart';
import 'package:postmanovich/core/use_case/use_case_response.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';
import 'package:postmanovich/domain/entity/project/project_info.dart';

typedef ProjectCreate = UseCaseResp<bool, ProjectException>;

typedef ProjectDelete = UseCaseResp<bool, ProjectDeleteException>;

abstract interface class ProjectUseCase {
  Future<ProjectCreate> create({required ProjectCreateParams params});

  Future<List<ProjectInfo>?> myProjects();

  Stream<List<ProjectInfo>?> myProjectsStream();

  Future<ProjectDelete> deleteProject({
    required String projectId,
  });
}
