import 'package:flutter/widgets.dart';
import 'package:postmanovich/core/error/app_error.dart';

abstract class RegisterException implements AppError {
  factory RegisterException.fromFirebase(String code) {
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

class EmailAlredeInUse implements RegisterException {
  @override
  String viewMessage(BuildContext context) {
    return "Аккаунт с такой почтой уже существует";
  }
}

class InvalidEmail implements RegisterException {
  @override
  String viewMessage(BuildContext context) {
    return "Неверный формат почты";
  }
}

class WeakPassword implements RegisterException {
  @override
  String viewMessage(BuildContext context) {
    return "Пароль слишком простой";
  }
}

class TooManyRequests implements RegisterException {
  @override
  String viewMessage(BuildContext context) {
    return "Слишком много попыток регистрации";
  }
}

class NetworkFailed implements RegisterException {
  @override
  String viewMessage(BuildContext context) {
    return "Отсутствует подключение к интернету";
  }
}

class UnknownRegisterError implements RegisterException {
  @override
  String viewMessage(BuildContext context) {
    return "Неизвестная ошибка при регистрации";
  }
}
