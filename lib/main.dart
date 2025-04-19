import 'package:flutter/material.dart';
import 'package:postmanovich/core/di/core_di.dart';
import 'package:postmanovich/core/root/app_root.dart';

void main() {
  runApp(
    CoreDi(
      child: const AppRoot(),
    ),
  );
}
