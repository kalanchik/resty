import 'package:flutter/widgets.dart';
import 'package:postmanovich/core/error/app_error.dart';

abstract class AuthError implements AppError {
  factory AuthError.fromFirebase(String errorCode) => switch (errorCode) {
        "invalid-email" => InvalidEmail(),
        "user-disabled" => UserDisabled(),
        "user-not-found" => UserNotFound(),
        "wrong-password" => WrongPassword(),
        "too-many-requests" => TooManyRequests(),
        "network-request-failed" => NetworkFailed(),
        "invalid-credential" => InvalidCredential(),
        _ => UnknownAuthError(),
      };
}

class InvalidEmail implements AuthError {
  @override
  String viewMessage(BuildContext context) {
    return "Неверный формат почты";
  }
}

class UserDisabled implements AuthError {
  @override
  String viewMessage(BuildContext context) {
    return "Данный пользователь заблокирован";
  }
}

class UserNotFound implements AuthError {
  @override
  String viewMessage(BuildContext context) {
    return "Такого пользователя не существует";
  }
}

class WrongPassword implements AuthError {
  @override
  String viewMessage(BuildContext context) {
    return "Неверный пароль";
  }
}

class TooManyRequests implements AuthError {
  @override
  String viewMessage(BuildContext context) {
    return "Слишком много попыток входа";
  }
}

class NetworkFailed implements AuthError {
  @override
  String viewMessage(BuildContext context) {
    return "Отсутствует подключение к интернету";
  }
}

class InvalidCredential implements AuthError {
  @override
  String viewMessage(BuildContext context) {
    return "Неверный логин/пароль";
  }
}

class UnknownAuthError implements AuthError {
  @override
  String viewMessage(BuildContext context) {
    return "Неизвестная ошибка при входе в аккаунт";
  }
}
