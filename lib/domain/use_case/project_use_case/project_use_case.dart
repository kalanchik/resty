import 'package:postmanovich/core/error/project_exc/project_exception.dart';
import 'package:postmanovich/core/use_case/use_case_response.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';

typedef ProjectCreate = UseCaseResp<bool, ProjectException>;

abstract interface class ProjectUseCase {
  Future<ProjectCreate> create({required ProjectCreateParams params});
}
