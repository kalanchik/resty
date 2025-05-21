import 'package:postmanovich/core/error/project_exc/project_exception.dart';
import 'package:postmanovich/data/repository/project_firebase_repository.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';

class ProjectFirestoreUseCase implements ProjectUseCase {
  final ProjectFirebaseRepository _repository;

  ProjectFirestoreUseCase(this._repository);

  @override
  Future<ProjectCreate> create({required ProjectCreateParams params}) async {
    try {
      final response = await _repository.create(params: params);

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
