import 'package:flutter/src/widgets/framework.dart';
import 'package:postmanovich/core/error/app_error.dart';

abstract class ProjectDeleteException implements AppError {}

class ProjectDeleteUnknownException implements ProjectDeleteException {
  @override
  String viewMessage(BuildContext context) {
    return "Не смогли удалить проект. Неизвестная ошибка";
  }
}
