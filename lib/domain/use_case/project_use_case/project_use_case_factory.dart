import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postmanovich/data/repository/project_firebase_repository.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_firestore_use_case.dart';
import 'package:postmanovich/domain/use_case/project_use_case/project_use_case.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ProjectUseCaseFactory {
  ProjectUseCaseFactory._();

  static ProjectUseCase create(BuildContext context) {
    return ProjectFirestoreUseCase(
      ProjectFirebaseRepository(
        FirebaseFirestore.instance,
        context.read<Talker>(),
      ),
    );
  }
}
