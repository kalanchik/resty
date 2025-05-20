import 'package:firebase_auth/firebase_auth.dart';
import 'package:postmanovich/core/error/auth_error/auth_error.dart';
import 'package:postmanovich/core/error/register_error/register_error.dart';
import 'package:postmanovich/data/repository/user_repository_impl.dart';
import 'package:postmanovich/domain/use_case/user_use_case/user_use_case.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UserFirebaseUseCase implements UserUseCase {
  final UserFirebaseRepository _repository;
  final Talker _logger;

  UserFirebaseUseCase(this._repository, this._logger);

  @override
  Future<LoginResp> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _repository.loginWithEmailAndPassword(
        email: email,
        password: password,
      );

      _logger.info('Login success');

      return (data: true, error: null);
    } catch (e) {
      _logger.error(e.toString());

      if (e is AuthError) {
        return (data: null, error: e);
      }

      return (
        data: null,
        error: UnknownAuthError(),
      );
    }
  }

  @override
  Future<RegisterResp> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final response = await _repository.registerWithEmailAndPassword(
        email: email,
        password: password,
      );

      _logger.info('Register success');

      if (response.user == null) {
        return (data: null, error: UnknownRegisterError());
      }

      await response.user!.updateDisplayName(username);

      return (data: true, error: null);
    } catch (e) {
      _logger.error(e.toString());

      if (e is RegisterException) {
        return (data: null, error: e);
      }

      return (
        data: null,
        error: UnknownRegisterError(),
      );
    }
  }

  @override
  Stream<User?> authStateChanges() => _repository.authStateChanges();

  @override
  Future<SignOutResp> signOut() async {
    try {
      await _repository.signOut();

      return (data: true, error: null);
    } catch (e) {
      return (data: true, error: null);
    }
  }
}
