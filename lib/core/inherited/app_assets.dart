import 'package:flutter/material.dart';
import 'package:postmanovich/config/assets/app_assets_data.dart';

class AppAssets extends InheritedWidget {
  const AppAssets({super.key, required this.data, required super.child});

  final AppAssetsData data;

  static AppAssetsData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppAssets>()?.data;
  }

  static AppAssetsData of(BuildContext context) {
    final AppAssetsData? result = maybeOf(context);
    assert(result != null, "AppAssets no found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(AppAssets oldWidget) {
    return data != oldWidget.data;
  }
}
