import 'package:flutter/material.dart';
import 'package:postmanovich/config/text_style/app_text_style_data.dart';

class AppTextStyle extends InheritedWidget {
  const AppTextStyle({super.key, required this.data, required super.child});

  final AppTextStyleData data;

  static AppTextStyleData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTextStyle>()?.data;
  }

  static AppTextStyleData of(BuildContext context) {
    final AppTextStyleData? result = maybeOf(context);
    assert(result != null, "AppTextStyle no found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(AppTextStyle oldWidget) {
    return data != oldWidget.data;
  }
}
