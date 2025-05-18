import 'package:flutter/material.dart';
import 'package:postmanovich/core/toast/shackbar_factory.dart';
import 'package:postmanovich/core/toast/snack_bar_type.dart';

class AppToast {
  AppToast._();

  static void show(
    BuildContext context, {
    SnackBarType type = const SnackBarTypeInfo(
      isFilled: true,
    ),
    required String? title,
    required String? body,
    bool showCloseButton = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBarFactory.create(
        context,
        type: type,
        title: title,
        body: body,
        showCloseButton: showCloseButton,
      ),
    );
  }
}
