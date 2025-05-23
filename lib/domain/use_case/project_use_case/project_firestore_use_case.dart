import 'package:postmanovich/core/error/project_exc/project_exception.dart';
import 'package:postmanovich/data/models/project/project_user_dto.dart';
import 'package:postmanovich/data/repository/project_firebase_repository.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';
import 'package:postmanovich/domain/entity/project/project_role.dart';
import 'package:postmanovich/domain/entity/project/project_user.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';

class ProjectFirestoreUseCase implements ProjectUseCase {
  final ProjectFirebaseRepository _repository;
  final UserUseCase _userUseCase;

  ProjectFirestoreUseCase(this._repository, this._userUseCase);

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
}
