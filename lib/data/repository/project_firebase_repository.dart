import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:postmanovich/data/models/project/project_user_dto.dart';
import 'package:postmanovich/domain/entity/project/project_create_params.dart';
import 'package:postmanovich/domain/repository/project_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ProjectFirebaseRepository implements ProjectRepository {
  ProjectFirebaseRepository(this._firestore, this._logger);

  final FirebaseFirestore _firestore;
  final Talker _logger;

  @override
  Future<bool> create({
    required ProjectCreateParams params,
    required ProjectUserDto user,
  }) async {
    try {
      final doc = _firestore.collection("projects").doc();

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
}
