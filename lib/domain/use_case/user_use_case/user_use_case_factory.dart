import 'package:firebase_auth/firebase_auth.dart';
import 'package:postmanovich/data/repository/user_repository_impl.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_firebase_use_case.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UserUseCaseFactory {
  UserUseCaseFactory._();

  static UserUseCase create(Talker logger) {
    return UserFirebaseUseCase(
      UserFirebaseRepository(FirebaseAuth.instance, logger),
      logger,
    );
  }
}
