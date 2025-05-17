import 'package:flutter/material.dart';
import 'package:postmanovich/config/assets/app_assets_data.dart';
import 'package:postmanovich/config/colors/app_colors_data.dart';
import 'package:postmanovich/config/numbers/app_numbers_data.dart';
import 'package:postmanovich/config/text_style/app_text_style_data.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/inherited/app_numbers.dart';
import 'package:postmanovich/core/inherited/app_text_style.dart';

class RootInherited extends StatelessWidget {
  const RootInherited({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppTextStyle(
      data: const AppTextStyleData(),
      child: AppNumbers(
        data: const AppNumbersData(),
        child: AppColors(
          data: AppColorsData.dark(),
          child: AppAssets(
            data: AppAssetsData(),
            child: child,
          ),
        ),
      ),
    );
  }
}
