import 'package:flutter/widgets.dart';
import 'package:postmanovich/core/error/app_error.dart';

abstract class ProjectException implements AppError {}

class ProjectUnknownException extends ProjectException {
  @override
  String viewMessage(BuildContext context) {
    return "Неизвестная ошибка при создании проекта";
  }
}
