import 'package:flutter/widgets.dart';
import 'package:postmanovich/core/error/app_error.dart';

abstract class RegisterError implements AppError {
  factory RegisterError.fromFirebase(String code) {
    switch (code) {
      case 'email-already-in-use':
        return EmailAlredeInUse();
      case 'invalid-email':
        return InvalidEmail();
      case 'weak-password':
        return WeakPassword();
      case 'too-many-requests':
        return TooManyRequests();
      case 'network-request-failed':
        return NetworkFailed();
      default:
        return UnknownRegisterError();
    }
  }
}

class EmailAlredeInUse implements RegisterError {
  @override
  String viewMessage(BuildContext context) {
    return "Аккаунт с такой почтой уже существует";
  }
}

class InvalidEmail implements RegisterError {
  @override
  String viewMessage(BuildContext context) {
    return "Неверный формат почты";
  }
}

class WeakPassword implements RegisterError {
  @override
  String viewMessage(BuildContext context) {
    return "Пароль слишком простой";
  }
}

class TooManyRequests implements RegisterError {
  @override
  String viewMessage(BuildContext context) {
    return "Слишком много попыток регистрации";
  }
}

class NetworkFailed implements RegisterError {
  @override
  String viewMessage(BuildContext context) {
    return "Отсутствует подключение к интернету";
  }
}

class UnknownRegisterError implements RegisterError {
  @override
  String viewMessage(BuildContext context) {
    return "Неизвестная ошибка при регистрации";
  }
}
