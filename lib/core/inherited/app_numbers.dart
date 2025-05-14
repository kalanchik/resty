import 'package:flutter/material.dart';
import 'package:postmanovich/config/numbers/app_numbers_data.dart';

class AppNumbers extends InheritedWidget {
  const AppNumbers({super.key, required this.data, required super.child});

  final AppNumbersData data;

  static AppNumbersData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppNumbers>()?.data;
  }

  static AppNumbersData of(BuildContext context) {
    final AppNumbersData? result = maybeOf(context);
    assert(result != null, "AppNumbers no found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(AppNumbers oldWidget) {
    return data != oldWidget.data;
  }
}
