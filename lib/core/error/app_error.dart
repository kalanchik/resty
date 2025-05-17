import 'package:flutter/material.dart';

abstract class AppError implements Exception {
  String viewMessage(BuildContext context);
}
