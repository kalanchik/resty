import 'package:equatable/equatable.dart';
import 'package:postmanovich/domain/entity/project/project_role.dart';

class ProjectUser extends Equatable {
  final String userId;
  final ProjectRole role;

  const ProjectUser({
    required this.userId,
    required this.role,
  });

  @override
  List<Object?> get props => [userId, role];
}
