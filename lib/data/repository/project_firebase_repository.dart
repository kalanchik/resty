import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:postmanovich/config/constants/globals.dart';
import 'package:postmanovich/data/models/project/project_user_dto.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';
import 'package:postmanovich/domain/repository/project_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ProjectFirebaseRepository implements ProjectRepository {
  ProjectFirebaseRepository(this._firestore, this._logger);

  final FirebaseFirestore _firestore;
  final Talker _logger;

  static const String _projects = "projects";

  static const String _usersUserIdIndex = "users.user_id";

  @override
  Future<bool> create({
    required ProjectCreateParams params,
    required ProjectUserDto user,
  }) async {
    try {
      final doc = _firestore.collection(_projects).doc();

      await doc.set(
        params.toFireStore(
          projectId: doc.id,
          owner: user.toMap(),
        ),
      );

      return true;
    } on FirebaseException catch (e) {
      _logger.error(e.toString());
      return false;
    }
  }

  Query<Map<String, dynamic>> _myProjectsQuery(String userId) {
    return _firestore.collection(_projects).where(
      "users",
      arrayContains: {
        "role_id": Globals.projectOwnerRoleId,
        "user_id": userId,
      },
    );
  }

  @override
  Future<List<Map<String, dynamic>>?> myProjects({
    required String userId,
  }) async {
    try {
      final quary = _myProjectsQuery(userId);

      final snapshot = await quary.get();

      if (snapshot.docs.isEmpty) {
        return [];
      }

      return snapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      _logger.error(e.toString());
      return null;
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> myProjectsStream({
    required String userId,
  }) {
    return _myProjectsQuery(userId).snapshots().map(
          (event) => event.docs.map((e) => e.data()).toList(),
        );
  }

  @override
  Future<bool> deleteProject({required String projectId}) async {
    final query = _firestore.collection(_projects).doc(projectId);

    try {
      await query.delete();

      return true;
    } catch (e) {
      return false;
    }
  }
}
