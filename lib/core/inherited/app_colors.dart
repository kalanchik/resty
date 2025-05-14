import 'package:flutter/material.dart';
import 'package:postmanovich/config/colors/app_colors_data.dart';

class AppColors extends InheritedWidget {
  const AppColors({super.key, required this.data, required super.child});

  final AppColorsData data;

  static AppColorsData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppColors>()?.data;
  }

  static AppColorsData of(BuildContext context) {
    final AppColorsData? result = maybeOf(context);
    assert(result != null, "AppColors no found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(AppColors oldWidget) {
    return data != oldWidget.data;
  }
}
