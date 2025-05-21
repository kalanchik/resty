import 'package:postmanovich/domain/entity/project/project_create_params.dart';

abstract interface class ProjectRepository {
  Future<dynamic> create({
    required ProjectCreateParams params,
  });
}
