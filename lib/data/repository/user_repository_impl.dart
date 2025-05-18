import 'package:firebase_auth/firebase_auth.dart';
import 'package:postmanovich/core/error/auth_error/auth_error.dart';
import 'package:postmanovich/core/error/register_error/register_error.dart';
import 'package:postmanovich/domain/repository/user_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UserFirebaseRepository implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final Talker _talker;

  UserFirebaseRepository(
    this._firebaseAuth,
    this._talker,
  );

  @override
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return response;
    } on FirebaseAuthException catch (e) {
      _talker.error(e.toString());
      final appError = AuthError.fromFirebase(e.code);
      throw appError;
    }
  }

  @override
  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return response;
    } on FirebaseAuthException catch (e) {
      _talker.error(e.toString());
      final appError = RegisterException.fromFirebase(e.code);
      throw appError;
    }
  }
}
