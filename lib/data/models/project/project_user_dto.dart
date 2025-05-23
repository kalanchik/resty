import 'package:equatable/equatable.dart';
import 'package:postmanovich/domain/entity/project/project_role.dart';
import 'package:postmanovich/domain/entity/project/project_user.dart';

class ProjectUserDto extends Equatable {
  final String userId;
  final int roleId;

  const ProjectUserDto({
    required this.userId,
    required this.roleId,
  });

  factory ProjectUserDto.fromEntity(ProjectUser user) => ProjectUserDto(
        userId: user.userId,
        roleId: user.role.id,
      );

  factory ProjectUserDto.fromMap(Map<String, dynamic> map) => ProjectUserDto(
        userId: map['user_id'],
        roleId: map['role_id'],
      );

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'role_id': roleId,
      };

  ProjectUser toEntity() => ProjectUser(
        userId: userId,
        role: ProjectRole.fromInt(roleId),
      );

  @override
  List<Object?> get props => [userId, roleId];
}
