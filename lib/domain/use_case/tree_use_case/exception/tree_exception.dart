import 'package:flutter/widgets.dart';

sealed class TreeException implements Exception {
  const TreeException();

  String errorMessage(BuildContext context);
}

class InvalidPathException implements TreeException {
  const InvalidPathException();

  @override
  String errorMessage(BuildContext context) {
    return "Некорретный путь";
  }
}
