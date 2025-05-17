import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postmanovich/core/inherited/app_assets.dart';
import 'package:postmanovich/core/widgets/app_logo/entity/app_logo_size.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = AppLogoSize.s,
    this.height,
  }) : assert(
          (size == null) != (height == null),
          "Используйте только один из параметров",
        );

  final AppLogoSize? size;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final double squareSize = switch (size) {
      null => height!,
      AppLogoSize.xs => 16,
      AppLogoSize.s => 24,
      AppLogoSize.m => 32,
      AppLogoSize.l => 512,
      AppLogoSize.xl => 1024,
    };

    return SizedBox(
      height: squareSize,
      width: squareSize,
      child: SvgPicture.asset(
        AppAssets.of(context).logo,
      ),
    );
  }
}
