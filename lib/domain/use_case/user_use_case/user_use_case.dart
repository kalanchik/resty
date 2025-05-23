import 'package:firebase_auth/firebase_auth.dart';
import 'package:postmanovich/core/error/app_error.dart';
import 'package:postmanovich/core/error/auth_error/auth_error.dart';
import 'package:postmanovich/core/error/register_error/register_error.dart';
import 'package:postmanovich/core/use_case/use_case_response.dart';

typedef LoginResp = UseCaseResp<bool, AuthError>;

typedef RegisterResp = UseCaseResp<bool, RegisterException>;

typedef SignOutResp = UseCaseResp<bool, AppError>;

abstract class UserUseCase {
  Future<LoginResp> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<RegisterResp> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });

  Stream<dynamic> authStateChanges();

  Future<SignOutResp> signOut();

  Future<User?> getCurrentUser();
}
